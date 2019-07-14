# Ruby 1.8.7 (支持 exerb 的最后版本)
# 编码问题: $! 中的中文字符默认为 GBK 编码, 网页返回数据为 UTF-8 编码
# Ruby 1.8 对编码不友好, 目前权宜之计为在 .NET 项目中进行转码

VERSION_ = 'IPGW_Core 2.0.1 [Jul 20 2019, by Zack Sun] on Win32'
HELPINFO = '基于 Ruby 1.8.7 的北京大学网关连接命令行界面 (CLI) 程序, 支持 Ruby 语言自定义连接脚本, ' +
           '可参考 examples 文件夹. 预先内置的函数/全局变量有 setProxy [代理设置], connection [网关' +
           '操作], $lastErr [最后错误信息] 等可供调用. 具体用法参见源代码注释及样例脚本.' + 
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
begin # 根据 Windows UUID 加密数据, 使之仅能在本机上读取
  locator = WIN32OLE.new("WbemScripting.SWbemLocator")
  wmi = locator.ConnectServer(".", "/root/cimv2")
  wmi.ExecQuery("Select * from Win32_ComputerSystemProduct").each {|i| $uuid = i.UUID.delete('-')[0, 32]}
rescue
  $stderr.puts '加/解密所需唯一标识符 Win32 UUID 获取失败 (RuntimeError)'
  exit
end

# 获取应用程序所在目录以定位 users.profile, ca.cer
# 对于 exerb 转化所得 .exe 文件, __FILE__ 不包含路径; 而
# 直接运行 .rb 调试时 GetModuleFileName 将会返回 ruby.exe 所在目录
# 两者都会导致问题, 因此调试时使用 __FILE__, 输出时使用 GetModuleFileName
begin
  $oriDir = Dir.pwd # 当前目录, 最后返回该目录
  buf = "\0" * 255
  len = Win32API.new('kernel32','GetModuleFileName','lpl','l').call(0, buf, 255)
  err = Win32API.new('kernel32','GetLastError','','l').call()
  raise if len.zero?
  # 应用程序所在目录
  $appDir = File.dirname(__FILE__)
  $appDir = File.dirname(buf[0, len]) if $appDir == '.'
  Dir.chdir($appDir)
rescue
  $stderr.puts "获取应用程序目录失败, 错误代码 #{err} (RuntimeError)"
  exit
end

$users = [] # [用户, 密码] 对
$lastErr = ''
begin
  # 数据结构: 首 16 字节记录初始向量 IV, 次 16 字节为用户名数据 (USERNM 用 \0 补足后与 IV 进行异或位运算)
  # 然后两字节记录加密块长度 (短整数型), 后者由 PASSWD 根据 KEY = UUID & USERNM 进行 AES-CBC-256 加密得到
  f = open('users.profile', 'rb')
  while iv = f.read(16)
    aes = OpenSSL::Cipher::AES.new(256, :CBC)
    aes.decrypt
    aes.iv = iv
    iv = iv.unpack('C*')
    usernm = ''
    (0..15).each {|i| usernm += [f.readbyte ^ iv[i]].pack('C')}
    aes.key = ([$uuid].pack('H*') + usernm)
    # 添加一对 [用户, 密码]
    $users << [usernm.rstrip, aes.update(f.read(f.read(2).unpack('S')[0])) << aes.final]
  end
rescue
  $stderr.puts($lastErr = '用户数据读取失败 (RuntimeError)')
  exit if $*[0].nil?
  $users = []
  exit unless $*[0].include?('save_cred') # 执行存储用户/密码的脚本时不退出
end

$usrLen = $users.length # 用户/密码组数量

def errMsg() # 错误信息
  return $lastErr = ($!.to_s + " (#{$!.class})\n\tfrom #{$@.join "\n\tfrom "}") # LastError
end

# 采用新版网关 API, 参考如下:
# https://blog.yangl1996.com/post/pku-its-api-spec/
# https://github.com/PKUHelper/pkuipgw
require 'net/https'
@http = Net::HTTP.new('its.pku.edu.cn', 443)
@http.use_ssl = true
@http.ca_file = 'ca.cer' # 根证书验证
@http.verify_mode = OpenSSL::SSL::VERIFY_PEER
@proxy = Net::HTTP::Proxy(nil)
@req = Net::HTTP::Post.new('/cas/ITSClient', initheader={'User-Agent' => 'IPGWiOS1.2_'})

def setProxy(addr, port=nil, user=nil, pass=nil) # 设置代理
  proxy = @proxy; http = @http
  @proxy = Net::HTTP::Proxy(addr, port, user, pass)
  @http = @proxy.new('its.pku.edu.cn', 443)
  @http.use_ssl = true
  @http.ca_file = 'ca.cer'
  @http.verify_mode = OpenSSL::SSL::VERIFY_PEER
rescue
  @proxy = proxy; @http = http
  $stderr.puts '代理设置失败: ' + errMsg
end

def connection(id=0, opr=0, ip_d='0.0.0.0') # 欲操作网关的用户编号 / 具体操作 (见下) / 欲断开的 IP
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
  reason = '网络连接失败: ' # 默认错误原因
  params.merge!({'username' => $users[id][0], 'password' => $users[id][1]})
  $stderr.puts "执行连接选项: #{params['cmd']}('#{ip_d}')@'#{params['username']}'"
  @req.set_form_data(params)
  @http.request(@req) do |res|
    body = res.body
    if res.is_a?(Net::HTTPOK)
      if body.include?('"succ"') # 执行成功
        if opr.zero?
          data = body.scan(/CONNECTIONS.*?(\d+).*BALANCE.*?(\d.*\d)".*IP.*?"(\d.*\d)"/)[0]
          return data # [连接数, 余额, IP], e.g. [3, 0.0, 10.128.171.106]
        elsif opr == 1
          data = body.scan(/(\d+\.\d+\.\d+\.\d+);.*?;(.*?);(\d+-\d+-\d+\s*\d+:\d+:\d+)/)
          return data # [[IP, 地点, 时间]], e.g. [[10.2.13.70, 31楼, 2019-07-03 22:01:35], [10.2.17.26, 31楼, 2019-06-23 20:41:40]
        elsif opr == 2
          return ip_d
        end
        return true
      end
      reason = '网关返回错误: ' + ($lastErr = body.scan(/":"(.*)"/)[0][0]) # 网页错误信息, 设置 LastError
    end
  end
  $stderr.puts reason + ' (RuntimeError)'
  return false
rescue
  reason += errMsg # 追加 "网络连接失败" 错误信息
  $stderr.puts reason
  return false
end

alias _eval eval
def eval(str, *argv) # 阻止加密信息外泄
  return if str.nil?
  raise '鉴于安全因素，程序将阻止某些变量的读取或更改。请重新设计脚本' if str.include?('$users') or str.include?('@http') or str.include?('@req') or str.include?('_eval')
  _eval(str, *argv)
end

# 执行自定义脚本
Dir.chdir($oriDir)
case $*[0]
  when '-e'; eval $*[1]
  when nil; puts VERSION_; puts; puts HELPINFO; puts; eval(gets(sep=nil))
  else eval(gets(sep=nil))
end

