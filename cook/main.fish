# TODO 应该生成一个中间文件，好给？加内容的，本TODO有两份
set -l l2
set -l l3
while read line
    if string match -r '^## .+' -q -- "$line"
        set l2 (string match -r '^#+ (.+)' -- "$line" | tail -n 1)
    else if string match -r '^### .+' -q -- "$line"
        set l3 (string match -r '^#+ (.+)' -- "$line" | tail -n 1)
    else if string match -q -- "- [*](./*)" $line
        set dish (string match -r -- "- \[(.+)]\(\.(.+)\)" $line | tail -n 2)
        echo \# $dish[1]:
        echo alias $dish[1]=\"open $argv[1]$dish[2]\"
        echo echo 请在浏览器中查看
        # TODO 或保存markdown到本地来查看？
    end
end
