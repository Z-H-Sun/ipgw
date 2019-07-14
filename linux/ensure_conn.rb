#!/usr/bin/env ruby
# encoding: UTF-8
# 请使用 Ruby 2+ 版本, 否则无法正常运行
# ensure_conn: 保持本机网关连接 (强制下线其他连接)
# 用法: <path_to/>ipgw ensure_conn.rb >> ipgw.log

exit if `ps -ax | grep ruby`.scan("ensure_conn").length > 1 # 不能打开多个以避免混乱
INTERVAL = 600 # 每隔十分钟检查一次
USERID = 0 # 使用第一号用户来连网关
PROXY =  [nil] # 若要启用代理可改为相应的值, 如 = ['127.0.0.1', 1080]

@ipgw = IPGW.new
@ipgw.setProxy(*PROXY) unless PROXY[0].nil?

# 检查是否联外网, 默认采用百度检验
def checkConn(timeout=5, site='www.baidu.com')
  http = @ipgw.proxy.new(site)
  http.open_timeout = timeout
  http.request_get('/') {|res| return res.class.to_s} # Net::HTTPOK
rescue Timeout::Error
  $stderr.puts '网络连接失败: 由于连接方在一段时间后没有正确答复或连接的主机没有反应，连接尝试失败。- ' + @ipgw.errMsg
rescue
  $stderr.puts '网络连接失败 - ' + @ipgw.errMsg
end

loop do  
  err = checkConn
  if err=='Net::HTTPOK' then sleep(INTERVAL); next end # 能连外网, 什么也不做

  puts "\nTIME\t#{Time.now}"
  puts "ERROR\t#{@ipgw.lastErr}"
  result = @ipgw.connection(USERID, 0) # 先尝试连接
  if result
    puts "CONN. #\t#{result[0]}"
    puts "BALANCE\t#{result[1]}"
    puts "IP_ADD\t#{result[2]}"
  else
    result = @ipgw.connection(USERID, 1)
    puts "REASON\t#{@ipgw.lastErr}"
    unless @ipgw.lastErr.include?('连接数') then sleep(INTERVAL); next end # 检查是否由超过连接数限制所致
    if result
      result.each {|i| i[2].insert(0, '*') unless i[1].include?('化学')}
      # 上一句中, 如果 IP 在化学楼外, 则在时间字符串最前面加 *
      # 那么按 ASCII 码排序就会更占先, 即优先断开非化学楼内 IP
      # 按这个思路可以规定其他规则. 如无必要可注释掉这一行
      result = result.sort_by{|i| i[2]}[0] # 按时间顺序排序, 优先断最早的 IP
      # 按这个思路可以规定其他规则. 如无必要则可注释掉这一行
      puts "DISCON.\t#{result[0]}"
      puts "LOCAT.\t#{result[1]}"
      puts "DATETM.\t#{result[2]}"
      
      @ipgw.connection(USERID, 2, result[0])
      sleep(1)
      
      result = @ipgw.connection(USERID, 0)
      if result
        puts "CONN. #\t#{result[0]}"
        puts "BALANCE\t#{result[1]}"
        puts "IP_ADD\t#{result[2]}"
      else
        puts "REASON\t#{@ipgw.lastErr}"
      end
    else
      puts "REASON\t#{@ipgw.lastErr}"
    end
  end
  sleep(INTERVAL)
end
