项目正在构建中

# 用途

让新手用中文与[fish](fishshell.com/)进行亲切的交流学习~

注意，这些指令均为与人类交互而设计，满足日常使用需求， **非常不建议自动化脚本中使用这些指令**！ 
可以通过 `type 某指令` 来查看其包装下的真实指令

# 用法

复制并运行下面的指令（请确保安装了[fish shell](fishshell.com/)，以后也许能把自动装fish加上）
```sh
test -d ~/.config/CmdStorm || git clone --depth 1 https://github.com/AmourAmer/CmdStorm.git ~/.config/CmdStorm || return 1
cd .config/CmdStorm && source ./入口.fish || echo 加载失败
cd -
```

如果已经下载过了，可以直接执行
```fish
cd .config/CmdStorm && source ./入口.fish || echo 加载失败
cd -
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
