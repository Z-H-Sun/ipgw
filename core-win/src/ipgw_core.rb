# Ruby 1.8.7 (支持 exerb 的最后版本)
# 编码问题: $! 中的中文字符默认为 GBK 编码, 网页返回数据为 UTF-8 编码
# Ruby 1.8 对编码不友好, 目前权宜之计为在 .NET 项目中进行转码

VERSION_ = 'IPGW_Core 2.0.1 [Jul 24 2019, by Zack Sun] on Win32'
HELPINFO = '基于 Ruby 1.8.7 的北京大学网关连接命令行界面 (CLI) 程序, 支持 Ruby 语言自定义连接脚本, ' +
           '可参考 examples 文件夹. IPGW 类内置函数有 setProxy [代理设置], connection [网关操作], ' +
           'lastErr [最后错误信息], users [用户列表] 等可供调用. 具体用法参见源代码注释及样例脚本.' + 
  "\n\n" + "选项:\t-e <\"script\">\t执行单行 Ruby 脚本;\n" +
           "\t-h\t\t显示本帮助后退出;\n" +
           "\t-v\t\t显示版本号后退出;\n" +
           "\t<*.rb>\t\t执行指定的 Ruby 文件;\n" +
           "\t(无传入参数)\t显示本帮助并执行标准输入 (STDIN) 中的 Ruby 代码, 读取以 EOF (^Z) 结束."
system 'chcp 65001 >nul' # 切换代码页为 UTF-8

case $*[0]
  when '-v'; puts VERSION_; exit
  when '-h'; puts VERSION_; puts; puts HELPINFO; exit
end
require 'openssl'
require 'Win32API'
require 'win32ole'
require 'net/https'
begin # 根据 Windows UUID 加密数据, 使之仅能在本机上读取
  locator = WIN32OLE.new("WbemScripting.SWbemLocator")
  wmi = locator.ConnectServer(".", "/root/cimv2")
  wmi.ExecQuery("Select * from Win32_ComputerSystemProduct").each {|i| $uuid = i.UUID.delete('-')[0, 32]}
rescue
  raise '加/解密所需唯一标识符 Win32 UUID 获取失败'
end

# 获取应用程序所在目录以定位 users.profile, ca.cer
# 对于 exerb 转化所得 .exe 文件, __FILE__ 不包含路径; 而
# 直接运行 .rb 调试时 GetModuleFileName 将会返回 ruby.exe 所在目录
# 两者都会导致问题, 因此调试时使用 __FILE__, 输出时使用 GetModuleFileName
begin
  buf = "\0" * 255
  len = Win32API.new('kernel32','GetModuleFileName','lpl','l').call(0, buf, 255)
  err = Win32API.new('kernel32','GetLastError','','l').call()
  raise if len.zero?
  # 应用程序所在目录
  $appDir = File.dirname(__FILE__)
  $appDir = File.dirname(buf[0, len]) if $appDir == '.'
rescue
  raise "获取应用程序目录失败, 错误代码 #{err}"
end

# 动态定义函数, Ruby 1.8.7 不支持, 强制公有化
class Class; public :define_method end
# 采用新版网关 API, 参考如下:
# https://blog.yangl1996.com/post/pku-its-api-spec/
# https://github.com/PKUHelper/pkuipgw
class IPGW
  attr_reader :lastErr # 最后错误信息
  attr_reader :proxy   # 代理设置
  def initialize
    @lastErr = ''
    # 类变量, 不允许公有读取
    @@http = Net::HTTP.new('its.pku.edu.cn', 443)
    @@req = Net::HTTP::Post.new('/cas/ITSClient', initheader={'User-Agent' => 'IPGWiOS1.2_'})
    setProxy(nil) # 初始化

    # 数据结构: 首 16 字节记录初始向量 IV, 次 16 字节为用户名数据 (USERNM 用 \0 补足后与 IV 进行异或位运算)
    # 然后两字节记录加密块长度 (短整数型), 后者由 PASSWD 根据 KEY = UUID & USERNM 进行 AES-CBC-256 加密得到
    users = [] # [用户, 密码] 对
    # 将密码信息严格限定在 IPGW 类的初始化函数中, 并通过动态定义函数的方式传递给其他可信的方法
    # 因为即使是定义为类变量, 且不允许修改类函数, 也可以通过类似 `class IPGW; p @@users end` 的代码泄露
    f = open(File.join($appDir, 'users.profile'), 'rb')
    while iv = f.read(16)
      aes = OpenSSL::Cipher::AES.new(256, :CBC)
      aes.decrypt
      aes.iv = iv
      iv = iv.unpack('C*')
      usernm = ''
      (0..15).each {|i| usernm += [f.readbyte ^ iv[i]].pack('C')}
      aes.key = ([$uuid].pack('H*') + usernm)
      # 添加一对 [用户, 密码]
      users << [usernm.rstrip, aes.update(f.read(f.read(2).unpack('S')[0])) << aes.final]
    end
    f.close
    raise if users.empty?

    # 只返回用户名而不返回密码, 或只返回个数 (getLenOnly=true)
    IPGW.define_method(:users) do |*getLenOnly|
      getLenOnly.first ? users.size : users.map {|i| i[0]}
    end

    IPGW.define_method(:connection) do |*argv| begin
      # 欲操作网关的用户编号 / 具体操作 (见下) / 欲断开的 IP / 超时
      id, opr, ip_d, timeout = *argv
      id = 0 if id.nil?
      opr = 0 if opr.nil?
      timeout = 5 if timeout.nil?
      @@http.open_timeout = @@http.read_timeout = timeout
      case opr
        when 1
          params = {'cmd' => 'getconnections'}
        when 2
          params = {'cmd' => 'disconnect', 'ip' => ip_d}
        when -1
          params = {'cmd' => 'close'}
        when -2
          params = {'cmd' => 'closeall'}
        else
          params = {'cmd' => 'open', 'iprange' => 'fee'}
      end
      params.merge!({'username' => users[id][0], 'password' => users[id][1]})
      $stderr.puts "执行连接选项: #{params['cmd']}('#{ip_d}')@'#{params['username']}'"
      req = @@req.clone # 避免泄露, 改用局部变量
      req.set_form_data(params)
      res = @@http.request(req)
      body = res.body
      if res.is_a?(Net::HTTPOK)
        if body.include?('"succ"') # 执行成功
          if opr.zero?
            body.scan(/CONNECTIONS.*?(\d+).*BALANCE.*?(\d.*\d)".*IP.*?"(\d.*\d)"/)[0]
            # [连接数, 余额, IP], e.g. [3, 0.0, 10.128.171.106]
          elsif opr == 1
            body.scan(/(\d+\.\d+\.\d+\.\d+);.*?;(.*?);(\d+-\d+-\d+\s*\d+:\d+:\d+)/)
            # [[IP, 地点, 时间]], e.g. [[10.2.13.70, 31楼, 2019-07-03 22:01:35], [10.2.17.26, 31楼, 2019-06-23 20:41:40]
          elsif opr == 2; ip_d
          else true end
        else
          $stderr.puts '网关返回错误: ' + (@lastErr = body.scan(/":"(.*?)"/)[0][0]) + ' (RuntimeError)'
          false # 网页错误信息, 设置 LastError
        end
      else raise('状态码响应异常: ' + res.class.to_s) end
    rescue StandardError, Timeout::Error
      $stderr.puts '网络连接失败: ' + errMsg
      false
    end end
  rescue
    raise(@lastErr = '用户数据未存储或读取失败')
  end

  def errMsg() # 错误信息
    return @lastErr = ($!.to_s + " (#{$!.class})\n\tfrom #{$@.join "\n\tfrom "}") # LastError
  end

  def setProxy(addr, port=nil, user=nil, pass=nil) # 设置代理
    proxy = @proxy; http = @@http
    if proxy.nil? # 初始化
      @proxy = Net::HTTP::Proxy(nil)
      # 不更改 @@http 初始值
    else
      @proxy = Net::HTTP::Proxy(addr, port, user, pass)
      @@http = @proxy.new('its.pku.edu.cn', 443)
      $stderr.puts '设置代理地址: "' + (addr.nil? ? '无"' : (user.to_s + '"@' + addr + (port.nil? ? '':":#{port}")))
    end
    @@http.use_ssl = true
    @@http.ca_file = File.join($appDir, 'ca.cer') # 根证书验证
    @@http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    return true
  rescue
    @proxy = proxy; @@http = http
    $stderr.puts '代理设置失败: ' + errMsg
    return false
  end

  # https://stackoverflow.com/a/21843709
  def self.method_added(name)
    # 仅允许在初始化时添加 users 和 connection 这两个方法
    raise(NameError, '鉴于安全性问题, 禁止更新 IPGW 类中的初始化方法') unless name == :users or name == :connection
  end
  def self.inherited(subclass); raise(NameError, '鉴于安全性问题, 禁止继承 IPGW 类') end
end

case $*[0] # 执行自定义脚本
  when '-e'; eval $*[1]
  when nil; puts VERSION_; puts; puts HELPINFO; puts; eval(gets(sep=nil))
  else f = File.exist?($*[0]) ? $*[0] : '(eval)'; eval(gets(sep=nil), TOPLEVEL_BINDING, f)
end
