
function 小小克隆
    # git clone --depth 1
end

function 解压
end

function 压缩
end

function 打包
end

function git无视
    # 克隆gitignore仓库到cache里
end

function 备份
    # 安装kopia
    # 建立仓库
    # 备份家或者给定路径
end

function 找
    if command -sq fd
        fd $argv[1]
    else
        find . -name "*$argv[1]*"
    end
end

function 重启
    reboot
end

function 关机
    shutdown
end

function 关机！ # 感叹号日后可能会当-f 用
    systemctl poweroff -i
end

# 签名
