# ~/.config/CmdStorm/profile
# ~/.config/fish/conf.d/指令风暴.fish
function 美化提示符
    提示 即将替换默认终端提示符
    if not command -qv starship && not 安装 starship
        提示 starship安装失败\n提示符美化失败，黯然神伤，落寞放弃\n当然其实提示符美化不止这一种办法\nfish自带的也不错，不过还没加相关代码\n欢迎PR啊！
        return 2
    end
    if not test -d ~/.config/fish/conf.d/ # TODO create this folder on setup; are there any chance this happens and we prompt?; respective configured fish conf dir
        提示 怎么没有~/.config/fish/conf.d/这个文件夹？\n创建一下吧\n如果你用的不是默认的fish文件夹\n那么抱歉尚未支持\n欢迎来PR！
        return 1
    end
    提示 预览提示符：
    starship prompt && echo
    # TODO show and choose
    询问 立即更换提示符 是 && starship init fish | source
    # add to profile, re-generate, TODO extract
    if 询问 默认启用starship 是
        mkdir -p ~/.config/CmdStorm/
        grep fish：starship ~/.config/CmdStorm/profile || echo fish：starship >>~/.config/CmdStorm/profile # TODO
        grep -q "starship init fish" ~/.config/fish/conf.d/指令风暴.fish || 声明占有 (echo "\
if status is-interactive
    starship init fish | source
end" | psub) >>~/.config/fish/conf.d/指令风暴.fish # TODO 非常愚蠢的，实数无奈，罪过罪过
    end
    # TODO choose
    return 0
end
