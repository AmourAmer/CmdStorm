local preset
local starship_toml = ""
function M.conf(app, content)
	if content.preset then
		starship_toml = starship_toml
			.. "# CmdStorm因"
			.. app
			.. "的选项preset "
			.. content.preset
			.. "自动生成\n" -- TODO use func in main.lua to generate comment
		preset = content.preset
	end
end

function M.output()
	if preset then
		print(".config/starship.toml\n" .. starship_toml)
		os.execute("starship preset " .. preset)
	end
end
