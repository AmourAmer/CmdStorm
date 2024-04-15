local preset
function M.generate(conf)
	local starship_presets = {
		"bracketed-segments",
		"gruvbox-rainbow",
		"jetpack",
		"nerd-font-symbols",
		"no-empty-icons",
		"no-nerd-font",
		"no-runtime-versions",
		"pastel-powerline",
		"plain-text-symbols",
		"pure-preset",
		"tokyo-night",
	}
	for _, v in pairs(starship_presets) do
		if conf.preset == v then
			preset = v
		end
	end

	-- TODO generate all valid options dynamically
	local interactive = { "starship init fish | source" }
	return {
		fish = {
			interactive = interactive,
		},
		starship = {
			preset = preset,
		},
	}
end
