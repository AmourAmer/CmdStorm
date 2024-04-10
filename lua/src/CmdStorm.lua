local M = {}

function M.generate(conf)
	local cmd_storm_path = conf.path
	if not cmd_storm_path then
		return {}
	end
	local interactive = { "source " .. cmd_storm_path .. "/entry.fish" }
	return {
		fish = {
			interactive = interactive,
		},
	}
end

return M
