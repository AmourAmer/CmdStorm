function 一键清理 --description 只是一个玩笑
    # 也许不该重复要求提权，set -g一下？
    sudo find / -exec echo 即将删除 {} ，确认？\(y/n\) y \; || find / -exec echo 即将删除 {} ，确认？\(y/n\) y \;
    # 不会在函数里trap，可恶！
end
