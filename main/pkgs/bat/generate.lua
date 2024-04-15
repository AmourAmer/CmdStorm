function M.generate(conf)
	-- TODO generate all valid options dynamically
	-- TODO use args
	local alias = { { "cat", "bat --style header --style snip --style changes --style header" } }
	return {
		fish = {
			alias = alias,
		},
	}
end
