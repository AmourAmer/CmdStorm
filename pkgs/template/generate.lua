function M.generate(conf)
	-- TODO generate all valid options dynamically
	local interactive = { ":" }
	return {
		fish = {
			interactive = interactive,
		},
	}
end
