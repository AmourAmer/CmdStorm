local conf_file = "" -- used in `conf.lua`
function M.generate(conf)
	-- TODO generate all valid options dynamically
	local interactive = { ":" }
	return {
		fish = {
			interactive = interactive,
		},
	}
end
