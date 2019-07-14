# save_cred: 保存多组 [用户, 密码] 对
# 请勿更改本文件名, 否则其他程序 (hotkeys, etc.) 可能无法正常运行
# 用法: <path_to/>ipgw_core "examples/save_cred.rb"
# 提示输入下一个用户名时, 按 Ctrl-C 中止并存储数据
# 输入密码时, 字符将以 * 隐藏, 需要系统预装 PowerShell (Win7 以上)
# 覆盖模式: 抹去之前所有记录; 追加模式: 在原有记录基础上添加新的用户/密码组

Dir.chdir $appDir
begin
  usrLen = IPGW.new.users(true)
  print "已有 #{usrLen} 组用户/密码记录, 启用 追加(A) / 覆盖(O) 模式? [A/O] "
  if STDIN.gets[0].chr.downcase == 'o'
    f = open('users.profile', 'wb')
    usrLen = 0
  else
    f = open('users.profile', 'ab')
  end
rescue
  puts '没有用户/密码记录, 启用覆盖模式.'
  f = open('users.profile', 'wb')
  usrLen = 0
end

loop do
  puts; puts "Entry ##{usrLen += 1} (在账号栏直接回车以结束)"
  print '  账号: '; usernm = STDIN.gets.chomp
  break if usernm.nil? or usernm.chomp.empty?
  usernm = usernm.ljust(16, "\0")
  # Powershell 加载起来比较慢, 暂无好的解决方案
  print '  密码: '; passwd = `powershell -command $psw=Read-Host -AsSecureString; [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($psw))`.chomp
  aes = OpenSSL::Cipher::AES.new(256, :CBC)
  aes.encrypt
  aes.key = ([$uuid].pack('H*') + usernm)
  f.print(iv = aes.random_iv)
  usernm = usernm.unpack('C*')
  iv = iv.unpack('C*')
  (0..15).each {|i| f.print([usernm[i] ^ iv[i]].pack('C'))}
  enc = aes.update(passwd) << aes.final
  f.print([enc.size].pack('S'))
  f.print(enc)
end
f.close; system('cls'); puts "共设置了 #{usrLen-1} 组账号"; exit
