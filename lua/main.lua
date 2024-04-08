local util = require("./util")
local profile = util.require("profile")
for key, value in pairs(profile) do
	-- TODO require failure? unused value? output to where?
	if value then
		util.require("src." .. key).generate(value)
	end
end
