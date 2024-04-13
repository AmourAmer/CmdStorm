local M = {}
-- TODO looks ugly, any better way? & config_dir
local handle = io.popen("id -unz | tr -d '\\0'")
local whoami = handle:read("*a")
handle:close()
handle = io.popen("echo -n $CMD_STORM_PATH")
local install_path = handle:read("*a")
handle:close()
package.path = package.path
	.. ";/home/"
	.. whoami
	.. "/.config/CmdStorm/lua/?.lua"
	.. ";"
	.. install_path
	.. "/lua/?/init.lua" -- TODO change to installed path and .local/share
	.. ";/home/"
	.. whoami
	.. "/.local/share/CmdStorm/lua/?/init.lua"

-- TODO comments, maybe
function M.require(module)
	local status, profile = pcall(require, module)
	if status then
		return profile
	else
		return {}
	end
end

return M
