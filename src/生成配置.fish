function 生成配置
    cd $CMD_STORM_PATH/lua/
    set -l tmp_dir (mktemp -d)
    # split, check, generate, 
    cat (lua main.lua | psub)
    rm -rf $tmp_dir
end
