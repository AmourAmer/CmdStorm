function 出没风波里 # 一次性用品，小小带个路而已
    if ! type -q ？
        source ~/.local/share/CmdStorm/src/入口.fish
        fish -ic "if ! type -q ？; echo 检测到尚未自动启用中文指令，运行『？  自动启用中文指令』查看; end"
    else
        echo 检测到『？』指令已经是可用状态，就不再加载了。如有需要请手动『source ~/.local/share/CmdStorm/src/入口.fish』
    end

    # read -P 警告，将要移除\n~/.config/fish/functions/出没风波里.fish
    # rm ~/.config/fish/functions/出没风波里.fish
end
