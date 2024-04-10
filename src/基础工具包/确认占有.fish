function 确认占有 --description 决定是否实地写入文件
    if test (count $argv) -eq 0
        求求 怎么是空列表！你要占有个啥啊？
        return 2
    else if test (count $argv) -gt 1
        求求 抱歉，只能确认一个文件是否要占有
        return 1
    end
    判定占有 "$argv" || : # DEBUG
end
