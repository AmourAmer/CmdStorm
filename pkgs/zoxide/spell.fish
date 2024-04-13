if test "$cmd" = z
    echo "M.zoxide = {}" $CMD_STORM_COMMENT
    emit CmdStorm_profile_changed
    zoxide init fish | source # TODO what if installation failed?
end
