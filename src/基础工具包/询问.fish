function 询问 --description "格式：问题 默认值"
    if not set --local DEFAULT $argv[2]
        set DEFAULT no
    end
    read -P "你希望$argv[1]么？[y/n]（默认$DEFAULT）" choice
    test -z $choice && set choice $DEFAULT
    switch $choice
        case 'n*' 'N*' '否*'
            return 1
        case 'y*' 'Y*' '是*'
            return 0
        case '*'
            提示 意料之外的输入，当作拒绝处理
            return 2
    end
end
