#/bin/bash
结语() {
	echo "#####################"
	echo "#" $@
	echo
}

提示() {
	echo $@
	echo -n "（输入回车以继续） "
	read
	echo
}

安装() {
	# 检查最近更新时间
	if command -v paru >/dev/null; then
		paru -S $@
	elif command -v yay >/dev/null; then
		yay -S $@
	elif command -v paru >/dev/null; then
		sudo pacman -S $@
	else
		结语 怎么连pacman都没有？目前本项目只支持arch系发行版
		exit 1
	fi
}

# 引导语
安装 fcitx5-im fcitx5-rime rime-ice-git
提示 安装方法来自 https://wiki.archlinux.org/title/Fcitx5
提示 用Linux，免不了要看许多文档，在本项目的帮助下开始学习搜索和阅读吧！
提示 作为Arch用户，我们很幸运地拥有完备的Arch Wik（百科）和“万能的”AUR（用户软件仓库）
提示 基本上，问题都可以在百科里找到答案；非官方支持的软件也很有可能可以在AUR里找到
提示 实在不行的话，还可以在社区里提问什么的，但是要尊重开源工作者哦
提示 毕竟人家没收钱，不需要对你负责，其实免责条款在LICENSE（许可证）里面也写得清清楚楚——开源软件不像某些软件，真没人逼着你用
提示 因此，要是对软件不满意，你可以礼貌地提issue，当然贡献代码去PR就更好了
提示 如果你在使用中碰到了问题，也不要立刻去发帖打扰大家，请先尝试自己搜索解决（本项目也会教你如何搜索的）
提示 对了，对微软这种拿钱做屎的开发者，尽可痛斥
# add
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# XMODIFIERS=@im=fcitx
提示 输入法已经安装好咯，登出再重进就可以快乐地输入中文啦～
提示 切换输入法的快捷键可能是Ctrl+Shift，也可能是Ctrl+空格，点任务栏里的键盘图标试试吧，想看纯文本的话可以看看~/.config/fcitx5/config
提示 有了中文之后，就可以几乎正式开始使用此项目咯！但是在此之前，还需要安装一些软件
安装 fish
# 是否要设为默认shell？默认否
# 是否安装wezterm？不然的话你要手动配alias之类的
# default key map
# settings/Regional Settings/Input Method/Configure global options/Trigger Input Method(Or maybe sth else)
