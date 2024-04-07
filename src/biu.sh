#!/bin/sh
# TODO maybe there're some apis to conf
# TODO add fcitx5-rime to profile and apply
# TODO show more info
nix-env -iA nixos.fish # TODO nixos?
kill $(pgrep fcitx5)
# TODO be less aggressive, merge, not replace
# TODO CMD_STORM_PATH
cp $CMD_STORM_PATH/资源/profile ~/.config/fcitx5/profile
# TODO 默认简体
echo 输入法即将就绪。使用ctrl+空格来切换输入法输入，ctrl+\`来切换为简体
fcitx5 >>/dev/null 2>&1 &
fish # TODO -C
