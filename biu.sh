#/bin/bash
echo() {
	command echo "#####################"
	command echo "#" $@
	command echo
}

安装() {
	if command -v paru >/dev/null; then
		paru -S $@
	elif command -v yay >/dev/null; then
		yay -S $@
	elif command -v paru >/dev/null; then
		sudo pacman -S $@
	else
		echo 怎么连pacman都没有？目前本项目只支持arch系发行版
		exit 1
	fi
}

# 引导语
安装 fcitx5-im fcitx5-rime rime-ice-git
# from website https://wiki.archlinux.org/title/Fcitx5
# add
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
echo 输入法已经安装好咯，登出再重进就可以快乐地输入中文啦～
# either have look at ~/.config/fcitx5/ or settings/Regional Settings/Input Method/Configure global options/Trigger Input Method(Or maybe sth else)
