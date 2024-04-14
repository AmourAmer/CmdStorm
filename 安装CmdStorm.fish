# TODO shouldn't use this var
# TODO replace all $CMD_STORM_PATH vars with installation path after compiling
source $CMD_STORM_PATH/entry.fish

提示 即将安装CmdStorm
echo "
M.CmdStorm = M.CmdStorm or {}
M.CmdStorm.path = \"$CMD_STORM_PATH\"
M.CmdStorm.fish_greeting = M.CmdStorm.fish_greeting or \"new\"
-- 由" (realpath (status current-filename)) 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path, conceal info(or simply a `sed`), not a function?!(relative 学习咒语)
emit CmdStorm_profile_changed
fish $CMD_STORM_PATH/compile.fish
提示 应该要写一些使用提示的，但是我还没写，如果你在使用最新版且看到了这行请来踢我，谢谢！
