if ! set -q CMD_STORM_INSTALL_PATH; or ! set CMD_STORM_INSTALL_PATH (realpath $CMD_STORM_INSTALL_PATH)
    echo 必须要正确设置CMD_STORM_INSTALL_PATH环境变量，停止编译！
    return 1
end

set -l CMD_STORM_PATH $argv[1]
# TODO 默认也许是用当前路径之类的？不知道怎么样更好
if test -z $CMD_STORM_PATH
    echo 需要传入待编译的路径
    return 2
else
    set CMD_STORM_PATH (realpath $CMD_STORM_PATH)
end

function cat
    command cat $argv 2>/dev/null
end

function mage # only 1 arg
    set -l f
    while read line
        if string match -r '^# .+:' "$line" >/dev/null
            if test -z $f
                set f y
            end
            echo -n "else if false;"
            for cmd in (string match -r '^# (.*):' $line | tail -n 1 | string split ' ')
                echo -n "or test \$cmd = '"$cmd"';"
            end
            echo
        else if ! test -z $f
            echo $line
        end
    end <$argv
end

# extract plugins
set -l dirs (ls $CMD_STORM_PATH/*/ -d)
mkdir -p $CMD_STORM_PATH/{assets,bin,src/{functions,abbrs},pkgs,lua}
for plugin in $dirs
    fish -C "cd $plugin" -c make # TODO show *sh files and makefile, then prompt 
    for dir in assets bin pkgs lua
        cp $plugin$dir/* $CMD_STORM_PATH/$dir -r
    end
    for f in functions abbrs
        cp $plugin$f/* $CMD_STORM_PATH/src/$f -r
    end
    # TODO conflicts, and order? maybe I need a list
end

# sed
sed -i 's|这一串中文字会在编译的时候被替换为CmdStorm的安装路径|'$CMD_STORM_INSTALL_PATH'|g' $CMD_STORM_PATH/{bin,src,pkgs,lua}**.{lua,fish}

# pkgs
set -l magic_book (mktemp -p /dev/shm/)
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
    mage $ipath/spell.fish >>$magic_book
    echo "return M" >>$opath
end
# TODO those silly handles
# TODO spells of pkgs

# 学习咒语.fish
# TODO refactor, limit cmds?
begin
    echo "\
function 学习咒语 --on-event fish_preexec --description compile.fish编译出来的 # TODO 搜指令应该更优雅一些
    if string match -r '\n' -q -- \$argv 
      return 2
    end
    set -l cmd (echo \$argv | awk '{ print \$1 }' | string trim)
    if type -q \"\$cmd\" # TODO shit, command -vq doesn't know alias!
        return
    end
    if false"
    cat $magic_book | sed 's/添加追踪信息再写入配置文件，这几个中文字会在编译的时候被换掉/" -- 由" (status current-function) 因指令 $argv 于 (date) 添加 >>~\/.config\/CmdStorm\/lua\/profile.raw.lua/' # TODO path
    echo "\
    else
      echo CmdStorm也不认识这个指令，要不来开个issue？或者你是想上网搜这个？
      set -q CMD_STORM_AUTO_BING && test $CMD_STORM_AUTO_BING -ne 0 || 询问 搜索(set_color green)\$argv(set_color normal) y && function \$cmd
      open \"https://bing.com/search?q=\$(status current-function) \$argv\"
    end
  end
end
"
end | fish_indent >$CMD_STORM_PATH/src/functions/学习咒语.fish
rm $magic_book
echo (set_color red)安装已完成，如果你看到上面一大坨输出，请不要慌张，你可以无视它们，它们是无害的（应该吧）(set_color normal) # TODO 该加这句么？或者至少不该在这个文件里放吧？
