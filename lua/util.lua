local M = {}

-- TODO comments, maybe
function M.require(module)
	-- TODO looks ugly, any better way? & config_dir
	local handle = io.popen("id -unz | tr -d '\\0'")
	local whoami = handle:read("*a")
	package.path = package.path .. ";/home/" .. whoami .. "/.config/CmdStorm/lua/?.lua" -- TODO change to installed path and .local/share
	handle:close()
	local profile = require(module)
	return profile
end

return M
