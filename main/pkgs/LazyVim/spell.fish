if test "$cmd" = lavi
    echo "M.LazyVim = M.LazyVim or {}" $CMD_STORM_COMMENT
    emit CmdStorm_profile_changed
    alias lavi "NVIM_APPNAME=lavi nvim"
end
