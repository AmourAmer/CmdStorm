-- You don't always need this file
-- please don't set vars here, define them(like `conf_file`) in generate.lua thx
function M.conf(app, content)
	if content.some_arg then
		conf_file = back_link(conf_file .. " #注释符号 ", app, { some_arg = content.some_arg })
	end
end

-- 我承认啊其实只要output不要conf也行，但是设计上output负责收尾和输出
function M.output()
	if false then
		print("path/to/file\n" .. conf_file)
	end
end
