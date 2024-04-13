function M.conf(app, content)
	-- TODO how to ensure existence of difft
	if content.pager == "difft" then -- TODO conflicts with delta
		pager = "difft"
		pager_app = app
	end
end

function M.output()
	config_yml = config_yml .. [[
git:
  paging:
    externalDiffCommand: difft --color=always --display=inline]]
	-- TODO should use color and display conf args in profile! I'll impl that later
	-- TODO maybe this can be done by sort of conf tool with lazygit? or any yaml tool? I may just call it to some output tmp file and cat that?
	config_yml = back_link(config_yml .. " # ", pager_app, { pager = pager })
	print(".config/lazygit/config.yml\n" .. config_yml)
end
