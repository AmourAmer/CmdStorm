function 生成配置
    cd $CMD_STORM_PATH/lua/
    # split, check, generate, 
    set -l start 1
    set -l file_path
    set -l file_content ''
    while read line
        if test $start -eq 1
            set file_path "$line"
            set file_content ''
            set start 0
        else if test $line = "华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈"
            # 确实有点脱裤子放屁的感觉，早知道我是这么用声明占有的我就不从文件读了，但也不一定，谁知道呢
            if 确认占有 "$HOME/$file_path" # 可恶！为什么不能用~！
                声明占有 (echo $file_content | psub) >"$HOME/$file_path"
            end
            set start 1
        else
            set file_content "$file_content"\n"$line"
        end
    end <(lua main.lua | psub)
end
