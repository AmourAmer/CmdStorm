pokemon
eza morden tools
function 使用Hyprland
    # 如果不是nix环境，拒绝，请自己动手
end

function 起飞，提示符
    if ! command -vq starship
        安装 starship || return 1 # 我也不知道返回几好
    end
    starship init fish | source
    # 也许应该问问要不要持久化
    # 如果不存在starship.toml，则挨个展示？写某一个？要不是有cargo，恐怕某些distro是要在几年后才能用上gruvbox
end

function 锦鳞游泳
    asciiquarium
end
