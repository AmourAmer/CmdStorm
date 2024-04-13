function 生成配置 --on-event CmdStorm_profile_changed # TODO maybe a daemon listening on raw.lua change
    echo "\
-- 此文件由CmdStorm自动生成，请勿编辑！
-- 请修改旁边的profile.raw.lua文件，那个（只要程序没bug）不会被覆盖
-- 如果你嫌这坨玩意儿不好看，可以看~/.local/share/CmdStorm/profile，如果没有这个文件请踢我更新
local M = {}
" >~/.config/CmdStorm/lua/profile.lua
    # TODO path
    cat ~/.config/CmdStorm/lua/profile.raw.lua >>~/.config/CmdStorm/lua/profile.lua
    echo "
return M" >>~/.config/CmdStorm/lua/profile.lua
    # split, check, generate, 
    set -l start 1
    set -l file_paths
    set -l file_path
    set -l file_contents
    set -l file_content ''
    while read line
        if test $start -eq 1
            if test -z $line
                continue
            end
            set file_path "$line"
            set file_content ''
            set start 0
        else if test $line = "华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈"
            set -a file_paths $file_path # Hope that space won't break nothing
            set -a file_contents $file_content # Hope that space won't break nothing, either
            set start 1
        else
            set file_content "$file_content"\n"$line"
        end
    end <(lua $CMD_STORM_PATH/lua/main.lua | psub)
    for i in (seq (count $file_paths))
        set -l file_path $file_paths[$i]
        set -l file_content $file_contents[$i]
        # 确实有点脱裤子放屁的感觉，早知道我是这么用声明占有的我就不从文件读了，但也不一定，谁知道呢
        if 确认占有 "$HOME/$file_path" # 可恶！为什么不能用~！
            声明占有 (echo $file_content | psub) >"$HOME/$file_path"
        end
    end
end
