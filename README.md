# IPGW

一个基于Ruby语言设计的跨平台北京大学网关操作命令行工具。

See Also: [IPGW_GUI项目](https://github.com/Z-H-Sun/IPGW_GUI)

## 特性

* 加密链接启用证书验证
* 使用新版网关接口，可查询当前连接和断开指定
* 支持HTTP/HTTPS代理 \*（请遵守相关法律法规和北京大学校园网使用规范）
* 支持存储多个账号
* 不使用明文储存用户名密码

    * [Windows版本](/README.md#Windows平台)以字节组形式储存于目录下`users.profile`中
    * [Linux/Mac版本](/README.md#LinuxMacOS平台)以加密数组储存于代码文件`ipgw`的`$users_enc`变量中
    * 均基于本机唯一标识符进行加密，加密信息在其他设备上读取无效

* 高度支持定制，可在[内置网关操作相关函数](/README.md#内置函数)的基础上运行Ruby脚本（但有效阻止了直接读取密码等敏感信息的恶意代码的执行）
* 提供Ruby脚本范例`hotkeys.rb`（仅Windows平台）和`ensure_conn.rb`等实用小工具，和交互式命令行工具`iipgw`：
<p align="center"><img width="60%" height="60%" src="/screenshots/iIPGW_mac.png"></p>

## Windows平台
### 运行

下载[最新发行版](https://github.com/Z-H-Sun/ipgw/releases/download/v2.01/Win32_release.zip)，解压至任意位置即可。主程序为`ipgw_core.exe`，可直接双击打开查看版本及帮助信息，具体使用方法见下文[命令行参数](/README.md#命令行参数)。首先双击运行`创建桌面快捷方式.bat`，将为两个小工具（脚本范例）`iipgw`和`hotkeys`创建桌面快捷方式，并可选择将后者设为开机启动以方便使用。小工具的具体使用方法见下节。

### IPGW Hotkeys

为网关操作提供全局热键（快捷键）支持。打开程序后会立即开启本机网关连接，之后只需按下对应的快捷键即可实现连接网关/断开连接/断开指定/断开全部等操作。默认`Ctrl+F8`=`连接网关`，`Shift+F8`=`断开本机`，`Alt+F8`=查看当前连接/`断开指定`，`Ctrl+Shift+F8`=`断开全部`，`Ctrl+Shift+Alt+F8`=`退出程序`。

首次运行时会提示输入网关账号密码，按提示进行操作即可。随后再次双击启动程序，会有黑窗口一闪而过，是正常现象，如无错误信息框弹出则即表明程序正常运行（*每次启动都会如此，~~如果强迫症患者觉得不舒服~~可以关注[IPGW GUI项目](https://github.com/Z-H-Sun/IPGW_GUI)）。

各网关操作只需按下对应快捷键即可实现，操作结果将显示在屏幕右上角（如下图所示）。

<table>
<tr>
    <th><img width="60%" height="60%" src="/screenshots/0.png"</th>
    <th><img width="60%" height="60%" src="/screenshots/1.png"></th>
    <th><img width="60%" height="60%" src="/screenshots/-1.png"></th>
    <th><img width="60%" height="60%" src="/screenshots/2.png"></th>
    <th><img width="60%" height="60%" src="/screenshots/3.png"></th>
    <th><img width="60%" height="60%" src="/screenshots/4.png"></th>
</tr>
</table>

其中，使用`断开指定`功能时可以**先查看当前连接**，如下图所示。若只查看连接而不进行断开操作，请输入0并回车，而**不要右上角叉关闭窗口**，这样的话程序就会立即退出，无法再响应快捷键。

<p align="center"><img width="40%" height="40%" src="/screenshots/-1-s.png"></p>

除了查看当前连接时显示命令行窗口外，其余情况下均默认隐藏。

#### 定制Hotkeys

需要对`hotkeys.rb`的代码进行改动。**请参考以下说明和文件中的注释**。
* 如果存储了多组账号，默认采取第一个账号进行网关操作。如果需要进行变更，请更改`USERID = 0`这一行。
* 默认不采用代理进行网关操作。如果需要启用代理，请更改`PROXY = [nil]`这一行，如`['127.0.0.1', 1080]`。
* 默认注册的快捷键如上文所述。如需更改，请更改`HOTKEYS = [2, 119, 4, 119, 6, 119, 1, 119, 7, 119]`这一行，详细说明见文件注释。
* 默认显示字体为微软雅黑。如需更改，请更改`FONT = [18, 0, 0, 0, 700, 0, 0, 0, 0, 0, 0, 0, 0, 'Microsoft YaHei UI']`这一行，详细说明及其他可行的预设见文件注释。

### Interactive IPGW

以交互模式执行连接网关的Ruby脚本，如下图所示。可参考[内置网关操作相关函数](/README.md#内置函数)。
<p align="center"><img width="60%" height="60%" src="/screenshots/iIPGW_win.png"></p>

### Ensure_Conn

用法：`<path_to/>ipgw_core "examples/ensure_conn.rb" >> ipgw.log`。保持本机网关连接，如果发现无法连接外网，先尝试连接网关；如果发现连接数太多，则强制下线其他连接（*具体规则为优先断开非化学楼内的、最早连接的IP地址。该规则可以在代码文件中参照注释进行更改*）；同时输出日志文件。可在脚本内修改连接网关的账号、检查网络的间隔和代理等。该脚本适用于实验室服务器，如有必要可设为开机自启服务（*其实更为推荐的做法是联系相关单位及计算中心*）。

### Save_Cred

用法：`<path_to/>ipgw_core "examples/save_cred.rb"`。设置储存在本地的网关账号、密码信息。会被`ensure_conn.rb`、`i_ipgw.rb`、`hotkeys.rb`所调用。

### 自己编译（开发者）

如果有必要对`ipgw_core.rb`的内容进行更改，那么你需要自己进行编译。首先你需要在自己的Windows系统上安装[Ruby 1.8.7](https://dl.bintray.com/oneclick/rubyinstaller/ruby-1.8.7-p374-i386-mingw32.7z)或**更低**版本。我知道这是一个很过时的版本，但很遗憾，这是最后一个支持EXERB的版本；而且之后版本的Ruby运行库体积剧增，不太适合用来发行。其次，你需要安装[EXERB](https://osdn.net/projects/exerb/downloads/54369/exerb-5.4.0.zip/)，它可以将Ruby脚本和其依赖项、运行库打包成一个可执行文件。最后，由于需要对生成的exe文件添加一些资源（特别是`hotkeys.rb`依赖该可执行文件内嵌的三个图标资源），因此可采用[Resource Tuner Console](http://www.heaventools.com/download-rtc.htm)等软件来进行自动化批处理操作。后者是一个付费软件，~~不过我相信总是有办法解决的~~。

如果满足以上条件，那么只需将更改后的`ipgw.rb`拷贝到`core-win/compile`文件夹下，双击`compile.bat`就行了，生成的可执行文件在上一级目录。我已经预先将Ruby依赖项复制到`lib`文件夹下，资源文件拷贝到`src`文件夹下，因此不需要额外的操作了。如果无法使用Resource Tuner Console，也可以用Restorator等软件来**手动添加**资源（可直接导入打包好的ipgw_core.res资源文件）。

其实在自己系统上装有Ruby运行库的条件下，完全可以用`ipgw_core.rb`替代`ipgw_core.exe`，唯一的问题是基于Ruby 1.8.7编写的代码与更高版本Ruby环境的兼容性问题（特别是编码和整数长度定义）。在写代码时我已经尽可能地考虑了这方面因素，但若作此替代仍需进行一些改动。具体过程不在此赘述。

## Linux/MacOS平台
### 运行

Mac OS X预装有Ruby环境（真是神奇……），所以只需下载源码即可。
* 如果想双击运行程序，存在系统“阻止来源”问题（因为下载的互联网文件有潜在的安全性问题，被系统强制阻止）。解决方法之一是开启“任何来源”；或者也可以自己新建一个文件，复制源码后粘贴保存即可（毕竟只有三个纯文本文件，这么做也很方便）。
* 在首次运行`iipgw`存储网关账号之后，可以使用Mac自带的Automator来实现**为网关操作添加系统快捷键**
* 大致流程为：打开Automator -> “服务” -> 运行 Shell 脚本 -> “服务”收到：没有输入; `~/<path/to>/ipgw -e "IPGW.new.connection(0,0)"` -> 保存；打开系统偏好设置 -> 键盘 -> 快捷键 -> 服务 -> 刚才保存的服务 -> 设置快捷键。即可为“连接本机网关”设置快捷键。其余同理不再赘述

Linux系统则需要先手动安装Ruby：`sudo apt install ruby-full`（当然non-sudoer也可以自己编译）。

适用于Linux和Mac OS的源码包可[点此下载](https://github.com/Z-H-Sun/ipgw/releases/download/v2.01/LinuxMacSource.tar.gz)（总共就3个文件：`ipgw`为核心文件，`iipgw`实现交互式脚本执行，`ensure_conn.rb`实现保持网关连接和记录网关日志功能）。`ipgw`和`iipgw`双击打开或在终端中输入即可运行。操作方法与[Windows版本](Windows平台)基本一致，不再赘述。
<p align="center"><img width="60%" height="60%" src="/screenshots/iIPGW.png"></p>

### 修改代码（开发者）

虽然`iipgw`基本上能满足大部分定制需求，但如果需要更改`ipgw`的代码，请勿修改对`$users_enc`（加密的用户名密码信息）赋值的那一行。每次设置用户名密码后，程序会自动储存/修改其赋值。手动修改可能会导致程序不能正确运行。

## 为什么选择 Ruby？
* 较小的解释器体积（相较于Python环境）
* 预装于Mac OS X
* 解释性语言，可以不经编译轻松实现交互、方便功能扩展
* 语法灵活易学，功能强大

## 命令行参数

直接双击打开`ipgw_core.exe`或`ipgw`，将显示帮助信息，随后程序将读取用户的标准输入(STDIN)直至EOF(Win=Ctrl-Z, Mac/Linux=Ctrl-D)，并将其作为Ruby代码执行。执行`ipgw_core.exe <*.rb>`或`ipgw <*.rb>`相当于将*.rb的文件内容重定向至STDIN，程序将执行文件中的Ruby代码（此时不显示帮助信息）。`ipgw_core.exe -e "some_script"`或`ipgw -e "some_script"`可执行单行Ruby代码。

Linux/MacOS版本中，执行`ipgw -u`可设置账号密码信息；在Windows版本中，为实现该目的可执行`ipgw_core "examples/save_cred.rb"`。

## 内置函数

在核心脚本文件中，预置了`IPGW`类。为了实现各类网关操作，首先需要初始化这个类：`@i = IPGW.new`，过程中程序会读取保存的账号密码信息，如果失败则会抛出异常。如果该类被成功初始化，则可调用以下方法：

### .users(getLenOnly=false)

返回保存的网关账号数组；若`getLenOnly=true`，仅返回数组元素个数

### .lastErr

返回最后错误信息

### .proxy

返回所使用的代理（Net::HTTP::Proxy对象）

### .setProxy(addr, port=nil, user=nil, passwd=nil)

更改进行网关操作时所使用的代理（地址、端口、用户名、密码）。若`addr=nil`，则不使用代理；返回true/false

### .connection(id=0, opr=0, ip='0.0.0.0', timeout=5)

对第`id`号账号进行`opr`号网关操作（0=连接网关，1=查询当前连接，2=断开指定IP为`ip`的连接，-1=断开当前，-2=断开全部），操作超时为`timeout`秒；返回true/false或具体信息（如`opr=1`时返回`[[IP, 地点, 连接时间]]`，`opr=0`时返回`[连接数, 余额, IP]`）

**注意**：目前网关接口不支持判断指定IP是否断开成功（一律返回`succ`），因此要确保填写的`ip`是正确的

### .save_cred（仅Linux/MacOS版本）

设置存储网关账号信息。Windows版本可使用`load(File.join($appDir, 'examples/save_cred.rb'))`实现类似功能。

### 全局变量 $appDir（仅Windows版本）

可执行文件所在目录。Linux/MacOS版本可使用`File.dirname(__FILE__)`实现类似功能。
