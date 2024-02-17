function 声明占有
    # TODO --force accquire
    # should I add them to a list?
    set -l info "\
此文件为CmdStorm所占有
在其中的修改很可能会被程序覆盖
如果你想从CmdStorm手中接管此文件
可以删除此段（主要是删除下面这行）"\n
    #     set -l info "\
    # 此文件为CmdStorm所强制占有
    # 在其中的修改很可能会被程序覆盖
    # 你无法从CmdStorm手中接管此文件（除非你修改源码）"\n
    for file in $argv # TODO 应该要么直接改文件，要么直允许一个参数……或者挨个prompt然后写？再看吧……
        if ! test -e $file
            求求 只能让存在的文件归CmdStorm占有啊
            continue
        end
        set -l more "
对了，也可以看看『"(basename $file)".CmdStorm.bak』文件
它是此文件被CmdStorm占有前的备份
说来惭愧，本来应该区分文件是否被强制占有的
但是还不是很会获取参数，所以其实现在此文件可能是被强制占有的
如果想知道的话可以看看源码里面哪些在声明占有之前是没判是否持有的"
        注释 (echo $info"子尚如此，陵复何望哉？"$more | psub)
        cat $file
        注释 (echo $info"余处幽篁兮终不见天，路险难兮独后来"$more | psub)
    end
end
