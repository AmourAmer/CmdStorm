function M.generate(conf)
	-- TODO generate all valid options dynamically
	local interactive = { "atuin init fish | source" }
	return {
		fish = {
			interactive = interactive,
		},
	}
end
