# TODO should compile and generate, don't use conditions everytime
# I wanted to use cowsay, but there's issue with Chinese. Pity.
function 提示
    if set -q CMD_STORM_SILENT; and test $CMD_STORM_SILENT -ne 0
        return
    end
    if command -q lolcat
        echo $argv | lolcat
    else
        echo -s (set_color red) '###'
        echo $argv | while read -l line
            echo -s (set_color red) '# ' (set_color normal) $line
        end
    end
    read -P "（输入回车以继续） "
    echo
end
