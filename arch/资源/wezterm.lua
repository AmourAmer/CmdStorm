--#_#_#_#_#
-- 此文件为CmdStorm所占有
-- 在其中的修改很可能会被程序覆盖
-- 如果你想从CmdStorm手中接管此文件
-- 可以删除此段（主要是删除下面这行）
-- 子尚如此，陵复何望哉？
-- 对了，也可以看看『wezterm.lua.CmdStorm.bak』文件
-- 它是此文件被CmdStorm占有前的备份
-- 说来惭愧，本来应该区分文件是否被强制占有的
-- 但是还不是很会获取参数，所以其实现在此文件可能是被强制占有的
-- 如果想知道的话可以看看源码里面哪些在声明占有之前是没判是否持有的
--#~#~#~#~#
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',
  'DengXian',
}

config.use_ime = true

return config
--#_#_#_#_#
-- 此文件为CmdStorm所占有
-- 在其中的修改很可能会被程序覆盖
-- 如果你想从CmdStorm手中接管此文件
-- 可以删除此段（主要是删除下面这行）
-- 子尚如此，陵复何望哉？
-- 对了，也可以看看『wezterm.lua.CmdStorm.bak』文件
-- 它是此文件被CmdStorm占有前的备份
-- 说来惭愧，本来应该区分文件是否被强制占有的
-- 但是还不是很会获取参数，所以其实现在此文件可能是被强制占有的
-- 如果想知道的话可以看看源码里面哪些在声明占有之前是没判是否持有的
--#~#~#~#~#
