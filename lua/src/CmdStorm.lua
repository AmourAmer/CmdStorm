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
	return {
		fish = {
			interactive = interactive,
		},
	}
end

return M
