# hotkeys: 为网关操作提供全局热键支持, 并在屏幕右上角显示连接状态图形
# 除非正在进行查询/断开指定操作, 命令行窗口将自动隐藏
# 本程序依赖三个图标文件, 嵌入于 ipgw_core.exe 中
# 若重新编译 ipgw_core, 请添加这些图标资源
# 用法: <path_to/>ipgw_core "examples/hotkeys.rb" 2>nul
# 该程序也可以设置成开机自启以方便使用

USERID = 0 # 使用第一号用户来连网关
PROXY =  [nil] # 若要启用代理可改为相应的值, 如 = ['127.0.0.1', 1080]

# 下面定制网关操作对应的热键, 分为五组不同操作, 每组两个参数
# 第一个值对应修饰键 (modifiers, 0=无, 1=Alt, 2=Ctrl, 4=Shift, 相加的值代表组合键)
# 第二个值对应其他键, 相应的值请参考“虚拟键码”
HOTKEYS = [2, 119, # 连接网关, Ctrl+F8
           4, 119, # 断开当前, Shift+F8
           6, 119, # 断开所有, Ctrl+Shift+F8
           1, 119, # 查询/断开指定, Alt+F8
           7, 119] # 退出程序, Ctrl+Shift+Alt+F8

# 下面定制图形显示字体
FONT = [18, 0, 0, 0,    # 高/宽 (0=默认值), 角度
        700, 0, 0, 0,  # 字重(400=regular, 700=bold), 斜体, 下划/删除线
        0, 0, 0, 0, 0, # 字符集, 精度, 质量, 间距 (0=默认值)
        'Microsoft YaHei UI']
# 其他一些可行的预设
# FONT = [15, 0, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, 'DengXian']
# FONT = [18, 6, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, 'System']
# FONT = [18, 6, 0, 0, 400, 0, 0, 0, 0, 0, 0, 0, 0, '']

$hWnd = Win32API.new('kernel32', 'GetConsoleWindow', 'l', 'l').call(0) # 命令行窗口句柄
RgstHtKy = Win32API.new('user32', 'RegisterHotKey', 'lill', 'l')
UnRgHtKy = Win32API.new('user32', 'UnregisterHotKey', 'li', 'l')
ExtIco = Win32API.new('shell32', 'ExtractIcon', 'ppl', 'l')
DesIco = Win32API.new('user32', 'DestroyIcon', 'l', 'l')
DrwIco = Win32API.new('user32', 'DrawIcon', 'llll', 'l')
FllRct = Win32API.new('user32', 'FillRect', 'lpl', 'l')
FrmRct = Win32API.new('user32', 'FrameRect', 'lpl', 'l')
DrwTxt = Win32API.new('user32', 'DrawText', 'lpipl', 'l')
ShwWin = Win32API.new('user32', 'ShowWindow', 'li', 'i')
MsgBox = Win32API.new('user32', 'MessageBox', 'lppi', 'l')

if `tasklist`.downcase.scan("ipgw_core").length > 1 # 不能打开多个以避免混乱
  MsgBox.call(0, "已有超过一个 IPGW_Core 实例正在运行\n本程序将立即退出以避免混乱", 'IPGW_Hotkeys', 0x1030) # GBK, 0x1030=系统模式+惊叹号图标
  exit
end

Dir.chdir $appDir
begin
  @ipgw = IPGW.new
  @ipgw.setProxy(*PROXY) unless PROXY[0].nil?
rescue
  MsgBox.call(0, "用户数据读取失败, 或未存储相关数据\n请在设置完毕退出后重启本程序", 'IPGW_Hotkeys', 0x1030)
  load('examples/save_cred.rb') # 执行其他 .rb 文件的范例
end

ShwWin.call($hWnd, 0) # 隐藏命令行窗口
# 下面获取显示器长宽, 不用更简单的:
# Win32API.new('user32','GetSystemMetrics','l','l').call(0)
# 方法是因为 Win10 中定制了放大率之后所得结果不准确
# 如 1080P 屏幕设置 125% 放大率后, 上述调用返回结果为
# 1920/1.25 = 1536, 则绘图位置将不准确
# 参考: https://www.twblogs.net/a/5b7e9fbf2b717767c6aae4ae/zh-cn
scr = "\0" * 188
Win32API.new('user32','EnumDisplaySettings','llp','l').call(0 , -1, scr)
scr = scr.unpack('A32S4Ls13A32SL*')
@sWid, @sHet = scr[22], scr[23]

# 这里可以定义图形出现的位置, 默认为屏幕右上角
@x, @y = @sWid - 130, 10
@x = 10 if @x < 0 # 以防 EnumDisplaySettings 调用失败的情况, 则改为左上角显示

begin
  @hIco = [0] * 4 # 图标
  (1..4).each {|i| raise if (@hIco[i-1] = ExtIco.call(0, 'ipgw_core.exe', i)).zero?}
  @hDc = Win32API.new('user32', 'GetDC', 'l', 'l').call(0) # 桌面的设备上下文
  @hBr = Win32API.new('gdi32', 'GetStockObject', 'l', 'l').call(18) # 刷子
  @hFont = Win32API.new('gdi32','CreateFontIndirect','p','l').call(FONT.pack('L5C8A*')) # 字体
  Win32API.new('gdi32','SelectObject','ll','l').call(@hDc, @hFont)
  raise if [@hDc, @hBr].include?(-1)
  # 注册热键, ID 号分别为 99~95
  (0..4).each {|i| raise if RgstHtKy.call(0, 99 - i, HOTKEYS[2 * i], HOTKEYS[2 * i + 1]).zero?}
rescue
  MsgBox.call(0, "发生了下列之一的致命错误:\n无法创建设备上下文/刷子/图标/热键关联", 'IPGW_Hotkeys', 0x1010) # GBK, 0x1010=系统模式+临界错误图标
  exit
end

def draw(opr, result=nil) # 0=连接, -1/1/2=断开指定/本机/所有, 3=失败, 4=程序
  opr = 3 if result == false # 操作失败
  result = result.scan(/\d+\..\d+/).join(".\n") if opr == -1 # IP 分成两行
  height = opr.zero? ? 120 : 54
  Win32API.new('gdi32','SetDCBrushColor','ll','l').call(@hDc, 0xFFFFFF)
  FllRct.call(@hDc, [@x, @y, @x + 120, @y + height].pack('l4'), @hBr)
  Win32API.new('gdi32','SetDCBrushColor','ll','l').call(@hDc, 0x800000)
  FrmRct.call(@hDc, [@x, @y, @x + 120, @y + height].pack('l4'), @hBr)
  FrmRct.call(@hDc, [@x + 1, @y + 1, @x + 119, @y + height - 1].pack('l4'), @hBr)
  DrwIco.call(@hDc, @x + 10, @y + 10, @hIco[[0, 1, 1, 2, 3, 1][opr]])
  if opr.zero?
    # GBK
    DrwTxt.call(@hDc, "已连接网关\n  (共 #{result[0]} 个)", -1, [@x + 48, @y + 10, @x + 120, @y + 50].pack('l4'), 0)
    DrwTxt.call(@hDc, "本机 IP 地址:", -1, [@x + 10, @y + 50, @x + 120, @y + 70].pack('l4'), 0)
    DrwTxt.call(@hDc, result[2], -1, [@x + 10, @y + 70, @x + 110, @y + 90].pack('l4'), 2)
    DrwTxt.call(@hDc, "余额: #{result[1]} 元", -1, [@x + 10, @y + 92, @x + 120, @y + 110].pack('l4'), 0)
  else
    DrwTxt.call(@hDc, ['', "断开本机\n网关连接", '断开所有', '连接失败', '正在退出', result][opr], -1, [@x + 54, opr < 2 ? @y + 9 : @y + 17, @x + 120, @y + 50].pack('l4'), 0)
  end
  # 就是得描两次边, 别问为什么, 总之不要删
  FrmRct.call(@hDc, [@x + 1, @y + 1, @x + 119, @y + height - 1].pack('l4'), @hBr)
  sleep(3)
  Win32API.new('user32','InvalidateRect','lpl','l').call(0, [@x, @y, @x + 120, @y + height].pack('l4'), 1) # 3 秒后强制刷新这个区域 (消掉图形)
end

# 系统启动时间 (in milliseconds), 消息接收时间以此为基准
@time = Win32API.new('kernel32','GetTickCount','v','l').call()
begin draw(0, @ipgw.connection(USERID, 0)) rescue draw(3) end
begin
  msg = "\0" * (RUBY_VERSION.to_f < 1.9 ? 28 : 44)
  while Win32API.new('user32','GetMessage','plll','l').call(msg, 0, 0, 0)
    # 若采用 Ruby 2.0+, 整数长度定义不同, 因此需判定 pack 结构
    m = msg.unpack(RUBY_VERSION.to_f < 1.9 ? 'L7' : 'Q4L3')
    # 4 秒内连续按热键则什么也不做
    if m[4] - @time < 4000
      Win32API.new('user32', 'MessageBeep', 'l', 'l').call(0x10)
      next
    else @time = m[4] end
    next if m[1] != 0x312 # 检测到热键
    case m[2]
      when 97..99; draw(99-m[2], @ipgw.connection(USERID, m[2]-99))
      when 96
        result = @ipgw.connection(USERID, 1)
        if result
          if result.empty?
            MsgBox.call(0, "没有可供断开的连接", 'IPGW_Hotkeys', 0x1030) # GBK
          else
            ShwWin.call($hWnd, 5) # 重新显示窗口
            system('cls')
            puts "IP\t\t\347\231\273\351\231\206\346\227\266\351\227\264\t\t\345\234\260\347\220\206\344\275\215\347\275\256" # UTF-8
            puts "-" * 50
            result.each {|i| puts i[0]+"\t"+i[2]+"\t"+i[1]}
            n = -1
            while n < 0
              print "\n\350\257\267\351\200\211\346\213\251\350\246\201\346\226\255\345\274\200\347\232\204\350\277\236\346\216\245\347\274\226\345\217\267 (1~#{result.length}, 0=\344\270\215\346\223\215\344\275\234): " # UTF-8
              n = STDIN.gets.chomp.to_i - 1
              break if n == -1
              n = -1 if n >= result.length
            end
            ShwWin.call($hWnd, 0)
            next if n < 0
            draw(-1, @ipgw.connection(USERID, 2, result[n][0]))
          end
        else
          draw(3)
        end
      when 95; break
    end
  end
rescue
  draw(3)
  retry
end
(95..99).each {|i| UnRgHtKy.call(0, i)}
draw(4)
(0..3).each {|i| DesIco.call(@hIco[i])}
Win32API.new('gdi32','DeleteObject','l','l').call(@hBr)
Win32API.new('gdi32','DeleteDC','l','l').call(@hDc)
