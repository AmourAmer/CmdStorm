项目正在构建中
该文件内容目前仅供参考，具体请查看除arch/外的文件（比如需要设置环境变量CMD_STORM_PATH）

## 用途

让新手用中文与[fish](fishshell.com/)进行亲切的交流学习~

注意，这些指令均为与人类交互而设计，满足日常使用需求， **非常不建议自动化脚本中使用这些指令**！ 
可以通过 `type 某指令` 来查看其包装下的真实指令

## 用法

所需软件：lua git

复制（网页上代码框的右上角应该有个一键复制的按钮）并运行下面的指令
```sh
test -d ~/.local/share/CmdStorm || git clone --depth 1 https://github.com/AmourAmer/CmdStorm.git ~/.local/share/CmdStorm 
bash ~/.local/share/CmdStorm/src/biu.sh
```

如果已经下载过了，可以直接执行
```fish
出没风波里
```
或
```fish
source ~/.local/share/CmdStorm/src/入口.fish 
```
即可在当前session中使用中文指令
%% TODO 如何持久化

## 目录结构

%% TODO 注意指令依赖，如systemd

## 所需发行版

nix

## 破茧

if you love this proj

## why linux
井井有条
漂亮
尽在掌控

- 只需要一个文件夹就可以复现系统软件和配置，与nix相比的优点是你使用本项目会自动改那个文件夹，而且里面提示非常友好 maybe need version lock
- 中文指令！各种炫酷操作和好用配置，一键解决！如备份文件
- 目前只针对日用，服务器……也许有插件 推荐mother-of-all-self-host
