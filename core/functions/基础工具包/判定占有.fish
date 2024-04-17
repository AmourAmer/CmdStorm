function 判定占有 --description 空文件也被视为为CmdStorm所占有
    if test (count $argv) -eq 0
        求求 倒是给个文件让我判啊，怎么是空列表！
        return 2
    else if test (count $argv) -gt 1
        求求 抱歉，这个函数只能判定一个文件是否在CmdStorm的管辖之下
        return 1
    end
    test -e $argv || return 0
    grep 子尚如此，陵复何望哉？ $argv -q && grep 余处幽篁兮终不见天，路险难兮独后来 $argv -q
end
