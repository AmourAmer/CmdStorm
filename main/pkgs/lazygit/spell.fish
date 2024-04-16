if test "$cmd" = lg; or test "$cmd" = lazygit
    echo "M.lazygit = M.lazygit or {}" 添加追踪信息再写入配置文件，这几个中文字会在编译的时候被换掉
    emit CmdStorm_profile_changed
end
