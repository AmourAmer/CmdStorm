local M = {}

-- TODO comments, maybe
function M.require(module)
	-- TODO looks ugly, any better way? & config_dir
	local handle = io.popen("id -unz | tr -d '\\0'")
	package.path = package.path .. ";/home/" .. handle:read("*a") .. "/.config/CmdStorm/lua/?.lua"
	handle:close()
	local profile = require(module)
	return profile
end

return M
