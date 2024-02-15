function 声明占有
    # should I add them to a list?
    set -l info "\
此文件为CmdStorm所占有
在其中的修改很可能会被程序覆盖
如果你想从CmdStorm手中接管此文件
可以删除此段（主要是删除下面这行）"\n
    for file in $argv
        if ! test -e $file
            求求 只能让存在的文件归CmdStorm占有啊
            continue
        end
        set -l more "
对了，也可以看看『"(basename $file)".CmdStorm.bak』文件
它是此文件被CmdStorm占有前的备份"
        注释 (echo $info"子尚如此，陵复何望哉？"$more | psub)
        cat $file
        注释 (echo $info"余处幽篁兮终不见天，路险难兮独后来"$more | psub)
    end
end
