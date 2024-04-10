function 学习咒语 --on-event fish_preexec # TODO 应该被编译出来
    set -l cmd "$argv[1]"
    if type -q "$cmd" # TODO shit, command -vq doesn't know alias!
        return
    end
    if test "$cmd" = lavi
        # TODO 应该多问问的，不该直接开干;而且直接赋值{}有点粗鄙，此处这么干还算合理，但是别处得注意
        echo "M.LazyVim = {} -- 由" (status current-function) 因指令 $argv 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path
        # TODO 应该搞成一个函数的
        echo "\
-- 此文件由CmdStorm自动生成，请勿编辑！
-- 请修改旁边的profile.raw.lua文件，那个（只要程序没bug）不会被覆盖
local M = {}
" >~/.config/CmdStorm/lua/profile.lua
        cat ~/.config/CmdStorm/lua/profile.raw.lua >>~/.config/CmdStorm/lua/profile.lua
        echo "
return M" >>~/.config/CmdStorm/lua/profile.lua
        生成配置
        alias lavi "NVIM_APPNAME=lavi nvim" # 万一用户没同意改config，咱也得加alias，但是感觉这个实现很丑陋
        # source ~/.config/fish/config.fish 
    end
    # TODO 加载插件内容
end
