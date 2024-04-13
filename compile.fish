# 在这个文件里面就可以看到新装pkg允许的操作，确乎是局限了些。
# 而且，很可能有恶意指令的，所以订阅还是要谨慎

# pkgs' lua files
for pkg in $CMD_STORM_PATH/pkgs/* # TODO should also source .loca/share?config?
    set path (path dirname (path dirname $pkg))
    set pkg (path basename $pkg) # 虽然可以不加path，但是我dirname那边加了——用fish的builtin也好
    mkdir -p $path/lua/pkgs/$pkg
    set ipath $path/pkgs/$pkg
    set opath $path/lua/pkgs/$pkg/init.lua
    echo "由CmdStorm自动生成，请勿编辑！" >$opath
    echo "Please edit lua files in your config dir and run compile.fish" >>$opath
    echo "local M = {}" >>$opath
    cat $ipath/generate.lua >>$opath
    cat $ipath/conf.lua >>$opath
    echo "return M" >>$opath
end
# TODO those silly handles
# TODO substitute all $CMD_STORM_PATH
# TODO spells of pkgs
