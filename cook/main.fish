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
        echo open $argv[1]$dish[2]
    end
end
