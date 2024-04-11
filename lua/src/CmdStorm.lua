local M = {}

function M.generate(conf)
	local cmd_storm_path = conf.path
	if not cmd_storm_path then
		return {}
	end
	local interactive = { "source " .. cmd_storm_path .. "/entry.fish" }
	if conf.silent then
		table.insert(interactive, "set -gx CMD_STORM_SILENT 1")
	end
	local fish_greeting
	if conf.fish_greeting == "new" then
		-- TODO should be more pretty
		fish_greeting = [[
echo 欢迎使用CmdStorm！很有品味！
echo 如果你不知道要干啥，不妨敲一个(set_color -o red)？(set_color normal)（中文全角问号）来运行一下吧
echo 如果出错了的话，那就是我还没写，请来踢我更新
echo 使用GNU/Linux快乐！
]]
	elseif conf.fish_greeting == "old" then
		fish_greeting = [[
echo 老用户了啊？用了这么久CmdStorm了？
echo 你以为我要谢谢你？
echo 才不，写点自己喜欢的fish_greeting吧，比如fastfetch？
echo 总不能还不会写吧？
]]
	elseif conf.fish_greeting == "older" then
		fish_greeting = [[
echo 感谢使用，感谢支持！
echo 啊，恶心心！（谁能告诉我怎么获得fish的背景色啊，我好把这句吐槽藏起来）
]]
	end
	local alias = conf.alias or {}
	return {
		fish = {
			interactive = interactive,
			fish_greeting = fish_greeting,
			alias = alias,
		},
	}
end

return M
