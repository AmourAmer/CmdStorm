# 入口文件，source了这个文件就可以快乐使用本项目了！
if ! set -q CMD_STORM_DATAHOME then
    set -g CMD_STORM_DATAHOME ~/.local/share/CmdStorm
end
for f in 这一串中文字会在编译的时候被替换为CmdStorm的安装路径/src/**.fish $CMD_STORM_DATAHOME/src/**.fish
    source $f # TODO fish files in ~/.config/fish/functions/ won't be sourced, here should use the same approach to define functions only
end
