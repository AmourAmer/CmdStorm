local M = {}

function M.generate(conf)
	local interactive = { "zoxide init fish | source" }
	return {
		fish = {
			interactive = interactive,
		},
	}
end

return M
