function M.generate(conf)
	-- TODO how to respect user conf and scripts?
	local nvim_appname = conf.nvim_appname or "lavi"
	-- TODO check match? notify? and I remember that there's something more. Ah! listen on unknown cmd `lavi`. Where to put alias? add to config.fish? should add a util! add maybe need git mirror?
	-- TODO what if local/share conflict?
	-- TODO brand new user must be missing tools to properly run
	os.execute([[
if [ ! -d ~/.config/]] .. nvim_appname .. [[ ]
then
  git clone --depth 1 https://github.com/LazyVim/starter ~/.config/]] .. nvim_appname .. [[ 
  rm -rf ~/.config/]] .. nvim_appname .. [[/.git
fi ]])
	local alias = { { nvim_appname, "NVIM_APPNAME=" .. nvim_appname .. " nvim" } }
	-- TODO shit, I lost this file when using lazygit! Also tons of time. Not quite sure if I missed anything
	return {
		fish = {
			alias = alias,
		},
	}
end
