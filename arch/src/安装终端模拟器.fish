# ~/.config/CmdStorm/profile
# ~/.config/wezterm/wezterm.lua
# KDE shortcut
function 安装终端模拟器
    command -vq wezterm || 安装 wezterm || return 2
    # TODO shortcut super+enter to open
    提示 wezterm默认的字体显示密码的时候有图标无法显示\nFira Code字体中有所需图标
    询问 "安装Fira Code" 是 && 安装 ttf-firacode-nerd || 询问 继续设置wezterm的字体 || return 2
    if not test -d ~/.config/fish/conf.d/
        提示 怎么没有~/.config/fish/conf.d/这个文件夹？\n创建一下吧\n如果你用的不是默认的fish文件夹\n那么抱歉尚未支持\n欢迎来PR！
        return 1
    end
    grep wezterm：firacode-nerd ~/.config/CmdStorm/profile || echo wezterm：firacode-nerd >>~/.config/CmdStorm/profile # TODO
    cp ~/.local/share/CmdStorm/资源/wezterm.lua ~/.config/wezterm/wezterm.lua
    return 0
end
