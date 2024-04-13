# 在这个文件里面就可以看到新装pkg允许的操作，确乎是局限了些。
# 而且，很可能有恶意指令的，所以订阅还是要谨慎

# pkgs' lua files
for pkg in $CMD_STORM_PATH/pkgs/* # TODO should also source .loca/share
    set path (path dirname (path dirname $pkg))
    set pkg (path basename $pkg) # 虽然可以不加path，但是我dirname那边加了——用fish的builtin也好
    rm -rf $path/lua/pkgs/$pkg
    mkdir -p $path/lua/pkgs/$pkg
    set ipath $path/pkgs/$pkg
    set opath $path/lua/pkgs/$pkg/init.lua
    echo "local M = {}" >$opath
    cat $ipath/generate.lua >>$opath
    cat $ipath/conf.lua >>$opath
    echo "return M" >>$opath
end
