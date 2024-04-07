function 安装常用工具
    command -vq zoxide || 安装 zoxide
    # TODO if empty, tokyo-night or other custom theme welcome
    command -vq starship || 安装 starship
    command -vq git || 安装 git
end
