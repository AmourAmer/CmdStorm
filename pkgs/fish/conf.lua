local config_fish = "if status is-interactive\n"
local fish_greeting
local fish_greeting_setter
-- TODO how about conflicts?
function M.conf(app, content)
	-- TODO an option to toggle put in the conf or in a .fish file?
	-- is-interactive
	if content["interactive"] then
		for _, v in pairs(content["interactive"]) do
			config_fish = back_link(config_fish .. v .. " # ", app)
		end
	end
	-- alias
	if content["alias"] then
		for _, v in pairs(content["alias"]) do
			-- TODO 缩进什么的，管不了了，要么用啥玩意儿来fmt一下
			config_fish = back_link((config_fish .. ("alias " .. v[1] .. ' "' .. v[2] .. '"') .. " # "), app)
		end
	end
	-- fish_greeting
	if content.fish_greeting then
		-- TODO conflict
		fish_greeting = content["fish_greeting"]
		fish_greeting_setter = app
	end
end

function M.output(app)
	-- end of status is-interactive
	config_fish = config_fish .. "end\n"
	config_fish = back_link(config_fish .. "function fish_greeting" .. " # ", fish_greeting_setter)
		.. fish_greeting
		.. "\nend\n"

	print(
		".config/fish/config.fish\n"
			.. config_fish
			.. "\n华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈\n"
	)
end
