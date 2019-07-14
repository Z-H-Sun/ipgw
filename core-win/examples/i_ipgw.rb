# i_ipgw: Interactive IPGW, 以交互模式执行连接网关的 Ruby 脚本
# 需要本文件夹下的 i_ipgw-lib 库的支持 (但其余 examples 并不依赖)
# 用法: <path_to/>ipgw_core "examples/i_ipgw.rb"

# 使用 Readline 模块将扩展历史记录功能, 捕获 Ctrl-C 信号, 支持自动补全等特性
# 但在某些终端模拟器中方向键/中文输入有问题, 且响应缓慢
$use_readline = true
def change_useReadline
  $use_readline = !$use_readline
  puts "目前#{'不' unless $use_readline}使用 Readline 模块. 可随时调用预存的历史命令 change_useReadline 更改该状态."
  IRB.CurrentContext.io = ($use_readline ? IRB::ReadlineInputMethod : IRB::StdioInputMethod).new
end

# 对于 Ruby 2-, 要支持 ANSI 必须先 system(...), 不知道为什么
system "title #{VERSION_.sub(/ipgw.*?core/i, 'Interactive IPGW')}"
puts HELPINFO.split("\n")[0]; puts
class String # 给字符串着色
  def c_str(color='2')
    winVer = `VER`.scan(/\d+\./)
    # Win10 TH2 (1511) 更新前, 终端不支持 ANSI
    # 此外, 不可勾选 "使用旧版控制台" (默认不勾选)
    return self if winVer[0].to_i < 10 or winVer[2].to_i < 10586
    return "\e[3#{color};1m#{self}\e[0m" # 着亮绿色
  end
end

$: << File.join($appDir, 'examples/i_ipgw-lib') # 添加额外运行库路径
# 同样的, 如果需要添加其他库, 在 $: 变量里引入对应目录即可
require 'irb'
require 'irb/completion'
# IRB.start 的坑爹之处在于不管之前如何设置了 IRB.conf,
# 之后都会重新初始化 (irb/init), 所以得重写 IRB.setup 方法
# 之所以不改写 IRB.start 是因为 Ruby 各版本之间变动太大
module IRB
  class << self
    alias _setup setup # 为 singleton method 创造假名
    # Ruby 2- 没有 <Module>.singleton_class.send 方法可用
  end
  class StdioInputMethod
    alias _gets gets
    def gets
      @prompt = @prompt.c_str unless @prompt[0, 2] == '=>'
      _gets
    end
  end
  def IRB.setup(*argv)
    IRB._setup(*argv)
    @CONF[:IRB_NAME] = 'iIPGW'
    @CONF[:USE_READLINE] = $use_readline
    @CONF[:PROMPT][:DEFAULT] = {
      :PROMPT_I => '%N #%03n >> ',
      :PROMPT_N => '%N #%03n >| ',
      :PROMPT_S => '%N #%03n >%l ',
      :PROMPT_C => '%N #%03n >* ',
      :RETURN => '=>'.c_str + " %s\n\n"
    }
  end
end

module RbReadline # 使用 Readline 模块时要解决的问题
  alias _rl_delete_text rl_delete_text
  module_function :_rl_delete_text
  module_function
  # 如果直接对 PROMPT 添加 ANSI 控制符, 则模块计算字符串长度时会多计入控制符, 导致移动光标时出 bug
  # 因此采用了迂回的方法
  def _rl_output_some_chars(string,start,count)
    str = string[start,count]
    str = str.c_str if str.match(/(^iIPGW #\d{3} \>.)/)
    @_rl_out_stream.write(str)
  end
  def rl_delete_text(from, to) # 解决了空行按 TAB 报错的 bug
    _rl_delete_text(from, to)
  rescue
    to-from
  end
end

print '启动交互式命令行界面. 预先定义 @i 为已初始化的 IPGW 类. 按 [↑/↓] 方向键可以调用历史命令, 其中预存有 @i.connection 及 @i.setProxy 等常用命令供快捷调用. 按 TAB 以实现自动补全提示. '
puts "目前#{'不' unless $use_readline}使用 Readline 模块. 可随时调用预存的历史命令 change_useReadline 更改该状态."; puts

begin
  @i = IPGW.new
rescue
  print '用户数据读取失败或未设置. 请在设置完成后重启本程序. '.c_str(3)
  load(File.join($appDir, 'examples/save_cred.rb')) # 执行其他 .rb 文件的范例
end
# 预先初始化 IPGW 类
puts "#{"iIPGW #000 >> ".c_str}@i = IPGW.new"
puts "#{"=> ".c_str}%s\n\n" % @i.inspect
Readline::HISTORY.push('change_useReadline', '@i.setProxy "127.0.0.1",1080', '@i.connection ')
IRB.start(nil)