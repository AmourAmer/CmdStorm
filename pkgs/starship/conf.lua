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
		print(
			"\n华丽丽的分割线，就靠这行来分文件了，不可能故意跟我重吧？救命啊，要不是我不会数lua的字符串里的回车数岂能这么憋屈\n"
		) -- TODO use func in main.lua to generate comment
	end
end
