function 安装
    # TODO 检查最近更新时间
    # TODO paru
    # TODO search or bb on failure
    # TODO how to exit PKGBUILD
    提示 "即将安装『$argv』"
    if command -q paru
        paru -S $argv
    else if command -q yay
        yay -S $argv
    else if command -q paru
        sudo pacman -S $argv
    else
        提示 又到了需要自己动手装软件的时候了\n如果你对此感到厌倦\n可以自行修改(type -p 安装)\n在其中添加你使用的包管理器\n如果你愿意贡献修改以帮助可与你碰到相同问题的人就更好了！
        # return 1
    end && echo 安装好"$argv"了，真不错
end
