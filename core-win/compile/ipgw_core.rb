VERSION_ = 'IPGW_Core 2.0.1 [Jul 20 2019, by Zack Sun] on Win32'
HELPINFO = '基于 Ruby 1.8.7 的北京大学网关连接命令行界面 (CLI) 程序, 支持 Ruby 语言自定义连接脚本, ' +
           '可参考 examples 文件夹. IPGW 类内置函数有 setProxy [代理设置], connection [网关操作], ' +
           'lastErr [最后错误信息], users [用户列表] 等可供调用. 具体用法参见源代码注释及样例脚本.' + 
  "\n\n" + "选项:\t-e <\"script\">\t执行单行 Ruby 脚本;\n" +
           "\t-h\t\t显示本帮助后退出;\n" +
           "\t-v\t\t显示版本号后退出;\n" +
           "\t<*.rb>\t\t执行指定的 Ruby 文件;\n" +
           "\t(无传入参数)\t显示本帮助并执行标准输入 (STDIN) 中的 Ruby 代码, 读取以 EOF (^Z) 结束."
system 'chcp 65001 >nul'
case $*[0]
  when '-v'; puts VERSION_; exit
  when '-h'; puts VERSION_; puts; puts HELPINFO; exit
end
require 'openssl'
require 'Win32API'
require 'win32ole'
require 'net/https'
begin
  locator = WIN32OLE.new("WbemScripting.SWbemLocator")
  wmi = locator.ConnectServer(".", "/root/cimv2")
  wmi.ExecQuery("Select * from Win32_ComputerSystemProduct").each {|i| $uuid = i.UUID.delete('-')[0, 32]}
rescue
  raise '加/解密所需唯一标识符 Win32 UUID 获取失败'
end
begin
  buf = "\0" * 255
  len = Win32API.new('kernel32','GetModuleFileName','lpl','l').call(0, buf, 255)
  err = Win32API.new('kernel32','GetLastError','','l').call()
  raise if len.zero?
  $appDir = File.dirname(__FILE__)
  $appDir = File.dirname(buf[0, len]) if $appDir == '.'
rescue
  raise "获取应用程序目录失败, 错误代码 #{err}"
end
class Class; public :define_method end
class IPGW
  attr_reader :lastErr
  attr_reader :proxy
  def initialize()
    @lastErr = ''
    @@http = Net::HTTP.new('its.pku.edu.cn', 443)
    @@req = Net::HTTP::Post.new('/cas/ITSClient', initheader={'User-Agent' => 'IPGWiOS1.2_'})
    setProxy(nil)
    users = []
    f = open(File.join($appDir, 'users.profile'), 'rb')
    while iv = f.read(16)
      aes = OpenSSL::Cipher::AES.new(256, :CBC)
      aes.decrypt
      aes.iv = iv
      iv = iv.unpack('C*')
      usernm = ''
      (0..15).each {|i| usernm += [f.readbyte ^ iv[i]].pack('C')}
      aes.key = ([$uuid].pack('H*') + usernm)
      users << [usernm.rstrip, aes.update(f.read(f.read(2).unpack('S')[0])) << aes.final]
    end
    f.close
    raise if users.empty?
    IPGW.define_method(:users) do |*getLenOnly|
      getLenOnly.first ? users.size : users.map {|i| i[0]}
    end
    IPGW.define_method(:connection) do |*argv| begin
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
      req = @@req.clone
      req.set_form_data(params)
      res = @@http.request(req)
      body = res.body
      if res.is_a?(Net::HTTPOK)
        if body.include?('"succ"')
          if opr.zero?
            body.scan(/CONNECTIONS.*?(\d+).*BALANCE.*?(\d.*\d)".*IP.*?"(\d.*\d)"/)[0]
          elsif opr == 1
            body.scan(/(\d+\.\d+\.\d+\.\d+);.*?;(.*?);(\d+-\d+-\d+\s*\d+:\d+:\d+)/)
          elsif opr == 2; ip_d
          else true end
        else
          $stderr.puts '网关返回错误: ' + (@lastErr = body.scan(/":"(.*)"/)[0][0]) + ' (RuntimeError)'
          false
        end
      else raise('状态码响应异常: ' + res.class.to_s) end
    rescue StandardError, Timeout::Error
      $stderr.puts '网络连接失败: ' + errMsg
      false
    end end
  rescue
    raise(@lastErr = '用户数据未存储或读取失败')
  end
  def errMsg()
    return @lastErr = ($!.to_s + " (#{$!.class})\n\tfrom #{$@.join "\n\tfrom "}")
  end
  def setProxy(addr, port=nil, user=nil, pass=nil)
    proxy = @proxy; http = @@http
    if proxy.nil?
      @proxy = Net::HTTP::Proxy(nil)
    else
      @proxy = Net::HTTP::Proxy(addr, port, user, pass)
      @@http = @proxy.new('its.pku.edu.cn', 443)
      $stderr.puts '设置代理地址: "' + (addr.nil? ? '无"' : (user.to_s + '"@' + addr + (port.nil? ? '':":#{port}")))
    end
    @@http.use_ssl = true
    @@http.ca_file = File.join($appDir, 'ca.cer')
    @@http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    return true
  rescue
    @proxy = proxy; @@http = http
    $stderr.puts '代理设置失败: ' + errMsg
    return false
  end
  def self.method_added(name)
    raise(NameError, '鉴于安全性问题, 禁止更新 IPGW 类中的初始化方法') unless name == :users or name == :connection
  def self.inherited(subclass); raise(NameError, '鉴于安全性问题, 禁止继承 IPGW 类') end
  end
end
case $*[0]
  when '-e'; eval $*[1]
  when nil; puts VERSION_; puts; puts HELPINFO; puts; eval(gets(sep=nil))
  else f = File.exist?($*[0]) ? $*[0] : '(eval)'; eval(gets(sep=nil), TOPLEVEL_BINDING, f)
end
