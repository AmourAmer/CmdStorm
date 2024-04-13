if test "$cmd" = lavi
    # TODO 应该多问问的，不该直接开干;而且直接赋值{}有点粗鄙，此处这么干还算合理，但是别处得注意
    echo "M.LazyVim = {}" $CMD_STORM_COMMENT
    emit CmdStorm_profile_changed
    alias lavi "NVIM_APPNAME=lavi nvim"
end
