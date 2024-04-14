# 在这个文件里面就可以看到新装pkg允许的操作，确乎是局限了些。
# 而且，很可能有恶意指令的，所以订阅还是要谨慎
function cat
    command cat $argv 2>/dev/null
end

set -l anbody_helps_me_to_name_this
# pkgs' lua files
# TODO should rm former dir in user local/share
for pkg in $CMD_STORM_PATH/pkgs/* # TODO should also source .loca/share?config? 糟糕，这样子没法完全用自定义的目录覆盖默认目录
    set path (path dirname (path dirname $pkg))
    set pkg (path basename $pkg) # 虽然可以不加path，但是我dirname那边加了——用fish的builtin也好
    mkdir -p $path/lua/pkgs/$pkg
    set ipath $path/pkgs/$pkg
    set opath $path/lua/pkgs/$pkg/init.lua
    echo "-- 由CmdStorm自动生成，请勿编辑！" >$opath
    echo "-- Please edit lua files in your config dir and run compile.fish" >>$opath
    echo "local M = {}" >>$opath
    cat $ipath/generate.lua >>$opath
    cat $ipath/conf.lua >>$opath
    set anbody_helps_me_to_name_this "$anbody_helps_me_to_name_this"\n(cat $ipath/spell.fish)
    echo "return M" >>$opath
end
# TODO those silly handles
# TODO substitute all $CMD_STORM_PATH
# TODO spells of pkgs

# 学习咒语.fish
# TODO refactor, limit cmds?
begin
    echo "\
function 学习咒语 --on-event fish_preexec --description compile.fish编译出来的 # TODO 搜指令应该更优雅一些
    set -l cmd (echo \$argv | awk '{ print \$1 }')
    if type -q \"\$cmd\" # TODO shit, command -vq doesn't know alias!
        return
    end"
    echo $anbody_helps_me_to_name_this | sed 's/\$CMD_STORM_COMMENT/" -- 由" (status current-function) 因指令 $argv 于 (date) 添加 >>~\/.config\/CmdStorm\/lua\/profile.raw.lua/' # TODO path
    echo "\
    # TODO 加载插件内容
end
"
end | fish_indent >$CMD_STORM_PATH/src/学习咒语.fish
