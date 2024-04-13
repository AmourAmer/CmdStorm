if test "$cmd" = starship
    echo "M.starship = M.starship or {}" $CMD_STORM_COMMENT
    emit CmdStorm_profile_changed
end
