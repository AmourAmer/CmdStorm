if test "$cmd" = lg; or test "$cmd" = lazygit
    echo "M.lazygit = M.lazygit or {}" $CMD_STORM_COMMENT
    emit CmdStorm_profile_changed
end
