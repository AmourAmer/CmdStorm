if test "$cmd" = cmd_storm_template
    echo "M.atuin = M.atuin or {}" $CMD_STORM_COMMENT
    emit CmdStorm_profile_changed
end
