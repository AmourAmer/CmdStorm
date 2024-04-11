package.path = package.path .. ";./?.lua" -- why lua of nix doesn't include this?
local util = require("util")
local profile = util.require("profile") -- TODO print into local/share
local F = {}

-- TODO how about conflicts?
-- TODO maybe I should split into files
function F.fish(conf)
	-- TODO an option to toggle put in the conf or in a .fish file?
	local config_fish = ""
	config_fish = config_fish .. "if status is-interactive\n"
	-- is-interactive
	for app, content in pairs(conf) do
		if content["interactive"] then
			for _, v in pairs(content["interactive"]) do
				config_fish = config_fish .. v .. " # CmdStorm因" .. app .. "的选项自动生成\n"
			end
		end
	end
	-- alias
	for app, content in pairs(conf) do
		if content["alias"] then
			for _, v in pairs(content["alias"]) do
				config_fish = config_fish
					.. ("alias " .. v[1] .. " " .. v[2]) -- 缩进什么的，管不了了，要么用啥玩意儿来fmt一下
					.. " # CmdStorm因"
					.. app
					.. "的选项自动生成\n"
			end
		end
	end
	config_fish = config_fish .. "end\n"
	-- fish_greeting
	local fish_greeting
	for app, content in pairs(conf) do
		if content.fish_greeting then
			-- TODO conflict
			fish_greeting = content["fish_greeting"]
			config_fish = config_fish
				.. "function fish_greeting"
				.. " # CmdStorm因"
				.. app
				.. "的选项自动生成\n"
				.. fish_greeting
				.. "\nend\n"
		end
	end
	print(
		".config/fish/config.fish\n"
			.. config_fish
			.. "\n华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈\n"
	)
end

function F.starship(conf)
	local preset
	local starship_toml = ""
	for app, content in pairs(conf) do
		if content.preset then
			starship_toml = starship_toml
				.. "# CmdStorm因"
				.. app
				.. "的选项preset "
				.. content.preset
				.. "自动生成\n"
			preset = content.preset
		end
	end
	if preset then
		print(".config/starship.toml\n" .. starship_toml)
		os.execute("starship preset " .. preset)
		print(
			"\n华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈\n"
		)
	end
end

states = {}

-- use configs to compute final state
for key, value in pairs(profile) do
	-- TODO require failure? unused value? output to where?
	if not value then
		goto skip
	end
	-- TODO shouldn't do this, should have sort of acl
	state = util.require("src." .. key).generate(value) -- TODO doesn't exist?
	for k, v in pairs(state) do
		-- TODO there is potential type problem
		if states[k] then
			states[k][key] = v
		else
			states[k] = {}
			states[k][key] = v
		end
	end
	::skip::
end

-- TODO and where should user funcs be used?
-- generate files from values of state
-- TODO value should have a more appropriate name
for app, value in pairs(states) do
	if F[app] then
		F[app](value)
	end -- TODO else?
end

-- TODO record managed files. apply patches
