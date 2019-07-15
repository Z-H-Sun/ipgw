# hotkeys: Ϊ���ز����ṩȫ���ȼ�֧��, ������Ļ���Ͻ���ʾ����״̬ͼ��
# �������ڽ��в�ѯ/�Ͽ�ָ������, �����д��ڽ��Զ�����
# ��������������ͼ���ļ�, Ƕ���� ipgw_core.exe ��
# �����±��� ipgw_core, �������Щͼ����Դ
# �÷�: <path_to/>ipgw_core "examples/hotkeys.rb" 2>nul
# �ó���Ҳ�������óɿ��������Է���ʹ��

USERID = 0 # ʹ�õ�һ���û���������
PROXY =  [nil] # ��Ҫ���ô���ɸ�Ϊ��Ӧ��ֵ, �� = ['127.0.0.1', 1080]

# ���涨�����ز�����Ӧ���ȼ�, ��Ϊ���鲻ͬ����, ÿ����������
# ��һ��ֵ��Ӧ���μ� (modifiers, 0=��, 1=Alt, 2=Ctrl, 4=Shift, ��ӵ�ֵ������ϼ�)
# �ڶ���ֵ��Ӧ������, ��Ӧ��ֵ��ο���������롱
HOTKEYS = [2, 119, # ��������, Ctrl+F8
           4, 119, # �Ͽ���ǰ, Shift+F8
           6, 119, # �Ͽ�����, Ctrl+Shift+F8
           1, 119, # ��ѯ/�Ͽ�ָ��, Alt+F8
           7, 119] # �˳�����, Ctrl+Shift+Alt+F8

# ���涨��ͼ����ʾ����
FONT = [18, 0, 0, 0,    # ��/�� (0=Ĭ��ֵ), �Ƕ�
        700, 0, 0, 0,  # ����(400=regular, 700=bold), б��, �»�/ɾ����
        0, 0, 0, 0, 0, # �ַ���, ����, ����, ��� (0=Ĭ��ֵ)
        'Microsoft YaHei UI']
# ����һЩ���е�Ԥ��
# FONT = [15, 0, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, 'DengXian']
# FONT = [18, 6, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, 'System']
# FONT = [18, 6, 0, 0, 400, 0, 0, 0, 0, 0, 0, 0, 0, '']

$hWnd = Win32API.new('kernel32', 'GetConsoleWindow', 'l', 'l').call(0) # �����д��ھ��
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

if `tasklist`.downcase.scan("ipgw_core").length > 1 # ���ܴ򿪶���Ա������
  MsgBox.call(0, "���г���һ�� IPGW_Core ʵ����������\n�����������˳��Ա������", 'IPGW_Hotkeys', 0x1030) # GBK, 0x1030=ϵͳģʽ+��̾��ͼ��
  exit
end

Dir.chdir $appDir
begin
  @ipgw = IPGW.new
  @ipgw.setProxy(*PROXY) unless PROXY[0].nil?
rescue
  MsgBox.call(0, "�û����ݶ�ȡʧ��, ��δ�洢�������\n������������˳�������������", 'IPGW_Hotkeys', 0x1030)
  load('examples/save_cred.rb') # ִ������ .rb �ļ��ķ���
end

ShwWin.call($hWnd, 0) # ���������д���
# �����ȡ��ʾ������, ���ø��򵥵�:
# Win32API.new('user32','GetSystemMetrics','l','l').call(0)
# ��������Ϊ Win10 �ж����˷Ŵ���֮�����ý����׼ȷ
# �� 1080P ��Ļ���� 125% �Ŵ��ʺ�, �������÷��ؽ��Ϊ
# 1920/1.25 = 1536, ���ͼλ�ý���׼ȷ
# �ο�: https://www.twblogs.net/a/5b7e9fbf2b717767c6aae4ae/zh-cn
scr = "\0" * 188
Win32API.new('user32','EnumDisplaySettings','llp','l').call(0 , -1, scr)
scr = scr.unpack('A32S4Ls13A32SL*')
@sWid, @sHet = scr[22], scr[23]

# ������Զ���ͼ�γ��ֵ�λ��, Ĭ��Ϊ��Ļ���Ͻ�
@x, @y = @sWid - 130, 10
@x = 10 if @x < 0 # �Է� EnumDisplaySettings ����ʧ�ܵ����, ���Ϊ���Ͻ���ʾ

begin
  @hIco = [0] * 4 # ͼ��
  (1..4).each {|i| raise if (@hIco[i-1] = ExtIco.call(0, 'ipgw_core.exe', i)).zero?}
  @hDc = Win32API.new('user32', 'GetDC', 'l', 'l').call(0) # ������豸������
  @hBr = Win32API.new('gdi32', 'GetStockObject', 'l', 'l').call(18) # ˢ��
  @hFont = Win32API.new('gdi32','CreateFontIndirect','p','l').call(FONT.pack('L5C8A*')) # ����
  Win32API.new('gdi32','SelectObject','ll','l').call(@hDc, @hFont)
  raise if [@hDc, @hBr].include?(-1)
  # ע���ȼ�, ID �ŷֱ�Ϊ 99~95
  (0..4).each {|i| raise if RgstHtKy.call(0, 99 - i, HOTKEYS[2 * i], HOTKEYS[2 * i + 1]).zero?}
rescue
  MsgBox.call(0, "����������֮һ����������:\n�޷������豸������/ˢ��/ͼ��/�ȼ�����", 'IPGW_Hotkeys', 0x1010) # GBK, 0x1010=ϵͳģʽ+�ٽ����ͼ��
  exit
end

def draw(opr, result=nil) # 0=����, -1/1/2=�Ͽ�ָ��/����/����, 3=ʧ��, 4=����
  opr = 3 if result == false # ����ʧ��
  result = result.scan(/\d+\..\d+/).join(".\n") if opr == -1 # IP �ֳ�����
  height = opr.zero? ? 120 : 54
  Win32API.new('gdi32','SetDCBrushColor','ll','l').call(@hDc, 0xFFFFFF)
  FllRct.call(@hDc, [@x, @y, @x + 120, @y + height].pack('l4'), @hBr)
  Win32API.new('gdi32','SetDCBrushColor','ll','l').call(@hDc, 0x800000)
  FrmRct.call(@hDc, [@x, @y, @x + 120, @y + height].pack('l4'), @hBr)
  FrmRct.call(@hDc, [@x + 1, @y + 1, @x + 119, @y + height - 1].pack('l4'), @hBr)
  DrwIco.call(@hDc, @x + 10, @y + 10, @hIco[[0, 1, 1, 2, 3, 1][opr]])
  if opr.zero?
    # GBK
    DrwTxt.call(@hDc, "����������\n  (�� #{result[0]} ��)", -1, [@x + 48, @y + 10, @x + 120, @y + 50].pack('l4'), 0)
    DrwTxt.call(@hDc, "���� IP ��ַ:", -1, [@x + 10, @y + 50, @x + 120, @y + 70].pack('l4'), 0)
    DrwTxt.call(@hDc, result[2], -1, [@x + 10, @y + 70, @x + 110, @y + 90].pack('l4'), 2)
    DrwTxt.call(@hDc, "���: #{result[1]} Ԫ", -1, [@x + 10, @y + 92, @x + 120, @y + 110].pack('l4'), 0)
  else
    DrwTxt.call(@hDc, ['', "�Ͽ�����\n��������", '�Ͽ�����', '����ʧ��', '�����˳�', result][opr], -1, [@x + 54, opr < 2 ? @y + 9 : @y + 17, @x + 120, @y + 50].pack('l4'), 0)
  end
  # ���ǵ������α�, ����Ϊʲô, ��֮��Ҫɾ
  FrmRct.call(@hDc, [@x + 1, @y + 1, @x + 119, @y + height - 1].pack('l4'), @hBr)
  sleep(3)
  Win32API.new('user32','InvalidateRect','lpl','l').call(0, [@x, @y, @x + 120, @y + height].pack('l4'), 1) # 3 ���ǿ��ˢ��������� (����ͼ��)
end

# ϵͳ����ʱ�� (in milliseconds), ��Ϣ����ʱ���Դ�Ϊ��׼
@time = Win32API.new('kernel32','GetTickCount','v','l').call()
begin draw(0, @ipgw.connection(USERID, 0)) rescue draw(3) end
begin
  msg = "\0" * (RUBY_VERSION.to_f < 1.9 ? 28 : 44)
  while Win32API.new('user32','GetMessage','plll','l').call(msg, 0, 0, 0)
    # ������ Ruby 2.0+, �������ȶ��岻ͬ, ������ж� pack �ṹ
    m = msg.unpack(RUBY_VERSION.to_f < 1.9 ? 'L7' : 'Q4L3')
    # 4 �����������ȼ���ʲôҲ����
    if m[4] - @time < 4000
      Win32API.new('user32', 'MessageBeep', 'l', 'l').call(0x10)
      next
    else @time = m[4] end
    next if m[1] != 0x312 # ��⵽�ȼ�
    case m[2]
      when 97..99; draw(99-m[2], @ipgw.connection(USERID, m[2]-99))
      when 96
        result = @ipgw.connection(USERID, 1)
        if result
          if result.empty?
            MsgBox.call(0, "û�пɹ��Ͽ�������", 'IPGW_Hotkeys', 0x1030) # GBK
          else
            ShwWin.call($hWnd, 5) # ������ʾ����
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
