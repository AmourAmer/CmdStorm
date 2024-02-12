#!/bin/bash
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

TUCAO=
安装() {
	# TODO 检查最近更新时间
	提示 即将安装『$@』
	if command -v paru >/dev/null; then
		paru -S $@
	elif command -v yay >/dev/null; then
		yay -S $@
	elif command -v paru >/dev/null; then
		sudo pacman -S $@
	else
		if [ -z $TUCAO ]; then
			提示 没有pacman？目前本项目只支持arch系发行版
			提示 但可能也不是完全不能用，试试自行安装『$@』（具体包名可能因发行版不同不完全一样）吧
			TUCAO=过了
		else
			提示 又到了需要自己动手装『$@』的时候了
		fi
		提示 如果成功安装了，就继续吧；否则可以Ctrl+C退出
	fi || 提示 看上去安裝出了问题？如果这不是你期待的结果，请尝试故障排查，简单的办法运行此指令重新运行本脚本：bash $0
}

问询() {
	DEFAULT=${2:-no}
	read -p 你希望$1么？[y/n]（默认${DEFAULT}） choice
	case ${choice:-$DEFAULT} in
	[nN]*) return 1 ;;
	否*) return 1 ;;
	[yY]*) return 0 ;;
	是*) return 0 ;;
	*)
		提示 意料之外的输入，当作拒绝处理
		return 1
		;;
	esac
}

提示 即将安装输入法，其中fcitx5-im主要是输入法框架（前端），rime是雾凇输入法引擎（后端），装了这俩就足以输入中文了。rime-ice是词库，可以提供更好的输入体验
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
提示 输入法已经安装好咯，登出再重进就可以快乐地输入中文啦～
提示 切换输入法的快捷键可能是Ctrl+Shift，也可能是Ctrl+空格，点任务栏里的键盘图标试试吧，想看纯文本的话可以看看~/.config/fcitx5/config
提示 图形界面的话大概在settings/Regional Settings/Input Method里的Configure global options/Trigger Input Method设置 # KDE
提示 有了中文之后，就可以几乎正式开始使用此项目咯！但是在此之前，还需要安装一些软件
提示 fish shell是必要的，请务必确保其可用
安装 fish
if 问询 将fish设置为默认终端; then
	chsh -s $(which fish)
fi
提示 本项目推荐的终端是wezterm，不过你可以自由选择使用什么终端
if 问询 安装wezterm; then
	安装 wezterm
	# 是否启用快捷键开终端
fi
mkdir -p ~/.config/fish/functions/
cp ~/.local/share/CmdStorm/出没风波里.fish ~/.config/fish/functions/ -n
结语 基础工具的安装到此就结束啦！输入『fish』并回车以运行fish，执行『出没风波里』来正式开始使用本项目吧！
