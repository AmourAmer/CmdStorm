regex 在需求中学习，如匹配开头，匹配日期
trans
gdb
查看位数
比如说，把我今天拍的照片传到电脑上，要分解这个任务
按键显示 showmethekey
录屏（及tweak）
mirror site?
syncthing
font
taskwarrior
fzf
加密
剪切
function 清理垃圾
end

function 贴士
    # 根据需要和评价订阅某些仓库吧，vim、typst之类的
end

function 帮助
    # man info tldr
    # 概要，例子
end

function 打印
    # 要是过多，记得prompt一下
end

function 定时执行
end

function Dota，启动
end

function 合并图片
end

function 编译运行
end

function 发送邮件
end

function 小小克隆
    # git clone --depth 1
end

function 解压
end

function 归档
end

function 压缩
end

function 打包
end

function git推送
    # 要是没有设置remote什么的就……问一下？教一下？
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
