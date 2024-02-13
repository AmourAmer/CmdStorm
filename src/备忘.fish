function 指令存在否
    command -s $argv
end

function 给用户加组
    echo 警告：需要root权限
    set -f grp $argv[1]
    set -f usr $argv[2]
    sudo usermod -aG $grp $usr
end
