if test "$cmd" = z
    echo "M.zoxide = M.zoxide or {}" 添加追踪信息再写入配置文件，这几个中文字会在编译的时候被换掉
    emit CmdStorm_profile_changed
    zoxide init fish | source # TODO what if installation failed?
end
