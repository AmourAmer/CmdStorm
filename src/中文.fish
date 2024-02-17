function 中文 --description 用户语言调成中文
    # TODO Immediate effect
    # expecting not modified sha1sum: 803513f7b01eefcff54373d981cd1f082e7af090  /etc/profile.d/locale.sh
    # TODO add choice of Chinese to profile
    if test -n $XDG_CONFIG_HOME && test -r "$XDG_CONFIG_HOME/locale.conf"
    else if test -n "$HOME" && test -r "$HOME/.config/locale.conf"
    end
end
