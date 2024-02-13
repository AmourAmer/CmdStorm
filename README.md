项目正在构建中

# 用途

让新手用中文与[fish](fishshell.com/)进行亲切的交流学习~

注意，这些指令均为与人类交互而设计，满足日常使用需求， **非常不建议自动化脚本中使用这些指令**！ 
可以通过 `type 某指令` 来查看其包装下的真实指令

# 用法

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

# 目录结构

%% TODO 注意指令依赖，如systemd

# 发行版推荐

arch
nix

# 破茧

# why linux
井井有条
漂亮
尽在掌控
