local M = {}

-- TODO comments, maybe
function M.require(module)
	-- TODO looks ugly, any better way? & config_dir
	local handle = io.popen("id -unz | tr -d '\\0'")
	local whoami = handle:read("*a")
	package.path = package.path
		.. ";/home/"
		.. whoami
		.. "/.config/CmdStorm/lua/?.lua"
		.. ";/home/"
		.. whoami
		.. "/CmdStorm/lua/?/init.lua" -- TODO change to installed path and .local/share
	handle:close()
	local status, profile = pcall(require, module)
	if status then
		return profile
	else
		return {}
	end
end

return M
