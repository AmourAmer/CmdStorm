local pager
local config_yml = ""
local pager_app
function M.generate(conf)
	-- TODO generate all valid options dynamically
	local pager
	if conf.difft then
		pager = "difft"
	end
	return {
		lazygit = {
			pager = pager,
		},
	}
end
