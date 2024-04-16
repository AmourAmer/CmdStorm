-- TODO looks ugly, any better way? & config_dir
local util = {}
local handle = io.popen("id -unz | tr -d '\\0'")
local whoami = handle:read("*a")
handle:close()
handle = io.popen("echo -n $CMD_STORM_DATAHOME")
local datahome = handle:read("*a")
handle:close()
if datahome == "" then
	datahome = "/home/" .. whoami .. "/.local/share/CmdStorm"
end

package.path = package.path
	.. ";/home/"
	.. whoami
	.. "/.config/CmdStorm/lua/?.lua"
	.. ";这一串中文字会在编译的时候被替换为CmdStorm的安装路径/lua/?/init.lua" -- TODO change to installed path and .local/share
	.. ";"
	.. datahome
	.. "/lua/pkgs/?/init.lua"

-- TODO comments, maybe
function util.require(module)
	local status, result = pcall(require, module)
	if status then
		return result
	else
		return {}
	end
end

function back_link(str, app, conf) -- ! 要自己带上注释哦！
	local detail = ""
	if conf then
		detail = "的某些选项（我还不是很会输出lua的table所以暂时在这看不了）"
		-- 的选项 preset " .. content.preset
	end
	return str .. "CmdStorm因" .. app .. "这选项" .. detail .. "自动生成\n"
end

local profile = util.require("profile") -- TODO print into local/share
local acl = util.require("acl") -- TODO create and use
local F = {}

states = {}

-- use configs to compute final state
for key, value in pairs(profile) do
	-- TODO require failure? unused value? output to where?
	if not value then
		goto skip
	end
	if not util.require("pkgs." .. key).generate then
		goto skip
	end
	state = util.require("pkgs." .. key).generate(value) -- TODO doesn't exist?
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
	local F = util.require("pkgs." .. app)
	if not F.output then -- TODO any better way to validate?
		goto skip2
	end
	pcall(F.init)
	for user, content in pairs(value) do
		-- TODO acl
		F.conf(user, content)
	end
	F.output()
	print(
		"\n华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈\n"
	)
	::skip2::
end

-- TODO record managed files. apply patches
