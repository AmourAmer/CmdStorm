# README

🚧 项目正在构建中，目前需要你先能用中文输入法，并且有fish等软件。

## 这个项目是做什么的？

简言之，建立用中文与计算机沟通的桥梁。

只要你能按出终端（一般是Ctrl+Alt+T），就能获得甚至胜过Windows的体验！

让你获得一种心安：当你想做一件你感觉计算机能做的事情的时候你知道自己能做到，数据安全，知道能在需要学一个知识点的时候精准快速学到
救命，我需要人帮我组织上面这句话的语言！
一定是因为这句话本来就不好说吧？一定不是因为我的语言能力退化了吧？！

注意，这些指令均为与人类交互而设计，满足日常使用需求， **非常不建议自动化脚本中使用这些指令**！ 

## 用法

试用：（注意必须在fish中运行）
```fish
git clone --depth 1 https://github.com/AmourAmer/CmdStorm
cd CmdStorm
set -x CMD_STORM_PATH (realpath .)
fish ./compile.fish
source ./entry.fish
```

就可以使用中文指令了！
比如说运行 `预配置` 就能自动配置 starship（美化提示符）, zoxide（智能路径跳转） 和 atuin（命令行历史管理），不过并不会安装，因为我还没写相关的指令。
或者运行 `？` 获取更多信息，不过我目前还没写。之前做了一些框架性的工作，实用的内容后续会加的，比如装聊天软件。

安装：（需要设置并export `CMD_STORM_PATH`）

```fish
fish ./安装CmdStorm.fish
```

## FAQ

Q: 为什么这个项目面向对象是中文用户，但是FAQ里有英文问题？
A: 为了节省你的时间，不浪费在一些与你无关的事情上面。

Q：怎么看一个中文指令实际上是什么？
A：可以通过 `type 某一个指令` 来查看其内部细节

Q：Linux上游戏难玩怎么办？
A：~~用Linux的人多了就有得支持了，请大家用steam的时候多参与参与调研发送数据什么的，也去论坛上多叫一叫~~ lutris了解下？以后会加入支持的。steam游戏的话上prontodb搜搜？以后会出手把手教程的。

Q：保真么？
A：当然不。那样成本就太大了，效率太低。我只负责把我这些时间来使用的理解写出来，如果有问题，可能是我太菜，理解能力不够，没有能力细看，也可能是写的人不行，但不管怎么样，免责声明在此。欢迎纠错！

Q：Do I really need this software?
A：Of course no! People were happy with Linux before it was created. But you might get happier with it.

Q：有搜索引擎和AI我为什么要用这个项目？
A：跟用vim是一个道理吧，为了抢救出关键的时间。诚然这个项目里整的东西都可以搜到学到，但是能不学为什么要学？直接发号施令多香啊，是吧～

Q: The profile.lua looks just like the nix language.
A: Indeed. If you want more control, you can of course use nix instead. After all, this project is just a, concierge? One reason you may want cmd_storm is that you can configure things easily with commands. And you can track and modify your profile in lua. And CmdStorm shouldn't manage your nix profile. ? Well, maybe could? Yes, I should, because I don't know how to config fcitx ctrl+shift shortcut.(Actually I know, I mean there may be something else I don't how to config while can be done by nix)

---

下面的还在施工，别看了！

Q:You monitor, and you get in my way
A:Seriously? All personal data are stored locally and the logic of how I use them is OPEN SOURCE. And I do ask on every conflict. I'm actually a descent servant.

Q：why linux
A：井井有条 漂亮 尽在掌控 Don't repeat yourself
- 只需要一个文件夹就可以复现系统软件和配置，与nix相比的优点是你使用本项目会自动改那个文件夹，而且里面提示非常友好 maybe need version lock
- 中文指令！各种炫酷操作和好用配置，一键解决！如备份文件
- 目前只针对日用，服务器……也许有插件 推荐mother-of-all-self-host

所需软件：lua git 等

复制（网页上代码框的右上角应该有个一键复制的按钮）并运行下面的指令
```sh
test -d ~/.local/share/CmdStorm || git clone --depth 1 https://github.com/AmourAmer/CmdStorm.git ~/.local/share/CmdStorm 
bash ~/.local/share/CmdStorm/src/biu.sh
```

## 所需环境

- nix(pkg) is offically supported, but you may be able to use this software with other pkg manager using a patch
- KDE(or hyprland?)

## 破茧

if you love this software

## 结构

`~/.config/CmdStorm/` 中存放了配置CmdStorm的文件
TODO
`~/.local/share/CmdStorm/` 中存放了相关的用户数据
TODO
`~/.cache/CmdStorm/` 中缓存文件

## 流程

make
run
plugin

为什么有这么多步骤呢？真复杂。
是为了简单。

