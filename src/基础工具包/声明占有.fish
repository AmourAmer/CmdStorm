function 声明占有 --description 无情地给所有文件添加头尾注释并一股脑儿输出到stdout（所以为什么要多文件呢？）
    set -l info "\
此文件为CmdStorm所占有
在其中的修改很可能会被程序覆盖
建议通过提供的中文指令来修改，方便省心；或者编辑~/.config/CmdStorm/lua/profile.lua
如果你想从CmdStorm手中接管此文件
可以删除此段（主要是删除下面这行）"\n
    for file in $argv
        set -l sign (comment_sign (path extension "$file"))
        set -l more "
对了，也可以看看旁边有没有加了后缀『.CmdStorm.bak』的文件
它是此文件被CmdStorm占有前的备份
不过设计更改过，所以这条提示不保真。再看看别的说法吧ovo
说来惭愧，本来应该区分文件是否被强制占有的
但是还不是很会获取参数，所以其实现在此文件可能是被强制占有的
如果想知道的话可以看看源码里面哪些在声明占有之前是没判是否持有的
如果看不懂上面这行的话，不要慌，因为我几个月之后也看不懂了
试试获取最新的本项目吧，如果还不行，那就踢我催更！"
        注释 (echo $info"子尚如此，陵复何望哉？"$more | psub) "$sign"
        cat $file
        注释 (echo $info"余处幽篁兮终不见天，路险难兮独后来"$more | psub) "$sign"
    end
end

# TODO 如果其他地方也用了，就写成一个独立的函数
function comment_sign # shouldn't have space
    switch "$argv"
        case '.lua'
            echo --
        case '.fish'
            echo '#' # Yes, redundant. Should be deleted
        case '*'
            echo '#'
    end
end
