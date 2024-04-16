#!/usr/bin/env fish
# TODO shouldn't use this var
# TODO replace all 这一串中文字会在编译的时候被替换为CmdStorm的安装路径 vars with installation path after compiling
source 这一串中文字会在编译的时候被替换为CmdStorm的安装路径/entry.fish

mkdir -p ~/.config/CmdStorm/lua
提示 进行CmdStorm的初始化
echo "
M.CmdStorm = M.CmdStorm or {}
M.CmdStorm.path = \"这一串中文字会在编译的时候被替换为CmdStorm的安装路径\"
M.CmdStorm.fish_greeting = M.CmdStorm.fish_greeting or \"new\"
-- 由" (realpath (status current-filename)) 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path, conceal info(or simply a `sed`), not a function?!(relative 学习咒语)
emit CmdStorm_profile_changed
提示 应该要写一些使用提示的，但是我还没写，如果你在使用最新版且看到了这行请来踢我，谢谢！
