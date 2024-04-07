# ~/.config/CmdStorm/profile
# KDE shortcut
function 安装终端模拟器
    command -vq kitty || 安装 kitty || return 2
    # TODO shortcut super+enter to open
    # TODO below no more fira install delugia
    询问 "安装Fira Code" 是 && 安装 ttf-firacode-nerd || 询问 继续设置wezterm的字体 || return 2
    if not test -d ~/.config/fish/conf.d/
        提示 怎么没有~/.config/fish/conf.d/这个文件夹？\n创建一下吧\n如果你用的不是默认的fish文件夹\n那么抱歉尚未支持\n欢迎来PR！
        return 1
    end
    grep wezterm：firacode-nerd ~/.config/CmdStorm/profile || echo wezterm：firacode-nerd >>~/.config/CmdStorm/profile # TODO
    mkdir -p ~/.local/share/CmdStorm/kitty # TODO XDG_DATA_HOME
    cp $CMD_STORM_PATH/资源/kitty.conf ~/.local/share/CmdStorm/kitty/kitty.conf
    return 0
end
