# 入口文件，source了这个文件就可以快乐使用本项目了！
set -gx CMD_STORM_PATH (path dirname (realpath (status current-filename)))
for f in $CMD_STORM_PATH/src/**.fish
    source $f
end
