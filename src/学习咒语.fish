function 学习咒语 --on-event fish_preexec # TODO 应该被编译出来
    set -l cmd "$argv[1]"
    if type -q "$cmd" # TODO shit, command -vq doesn't know alias!
        return
    end
    if test "$cmd" = lavi
        # TODO 应该多问问的，不该直接开干;而且直接赋值{}有点粗鄙，此处这么干还算合理，但是别处得注意
        echo "M.LazyVim = {} -- 由" (status current-function) 因指令 $argv 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path
        生成配置
        alias lavi "NVIM_APPNAME=lavi nvim" # 万一用户没同意改config，咱也得加alias，但是感觉这个实现很丑陋
        # source ~/.config/fish/config.fish 
    else if test "$cmd" = z
        echo "M.zoxide = {} -- 由" (status current-function) 因指令 $argv 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path
        # TODO urgent, de-duplicate
        生成配置
        zoxide init fish | source # TODO what if installation failed?
    else if test "$cmd" = starship # TODO 强烈感觉应该改变文件结构了，这些文件应该是编译生成的，比如src/工具包/编译CmdStorm
        echo "M.starship = {} -- 由" (status current-function) 因指令 $argv 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO untested
        生成配置
    end
    # TODO 加载插件内容
end
