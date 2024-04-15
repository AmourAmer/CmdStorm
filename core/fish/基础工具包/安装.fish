function 安装
    # TODO search or bb on failure
    # TODO or temply?
    提示 "即将安装『$argv』"
    # TODO 支持一下termux？
    if command -q nix-env
        nix-env -iA nixos.$argv && echo 安装好"$argv"了，真不错 && return 0
    end
    提示 又到了需要自己动手装软件的时候了\n如果你对此感到厌倦\n可以自行修改(type -p 安装)\n在其中添加你使用的包管理器\n如果你愿意贡献修改以帮助可与你碰到相同问题的人就更好了！
    return 1
end
