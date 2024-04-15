local preset
local starship_toml = ""
function M.conf(app, content)
	if content.preset then
		starship_toml = back_link(starship_toml .. "# ", app, { preset = content.preset })
		preset = content.preset
	end
end

function M.output()
	if preset then
		print(".config/starship.toml\n" .. starship_toml)
		os.execute("starship preset " .. preset)
	end
end
