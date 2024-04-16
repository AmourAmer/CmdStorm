if test "$cmd" = lavi
    echo "M.LazyVim = M.LazyVim or {}" 添加追踪信息再写入配置文件，这几个中文字会在编译的时候被换掉
    emit CmdStorm_profile_changed
    alias lavi "NVIM_APPNAME=lavi nvim"
end
