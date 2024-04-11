function 预配置
    # TODO 如果用户的profile包含了所有这些，那么提示可以运行……不对，这一坨还是……不对，还是提示一下
    set -l preset $argv[1]
    if test $preset = base; or test $preset = 基础
        # TODO 这重复地真离谱了，可恶，我需要merge！
        echo " -- 以下
if not M.zoxide then
  M.zoxide = {}
end
if not M.starship then
  M.starship = {}
end
if not M.starship.preset then
  M.starship.preset = \"gruvbox-rainbow\"
end
if not M.CmdStorm.alias then
  M.CmdStorm.alias = {
    { \"rm\", \"echo 为防止误操作，请使用murder\" },
    { \"murder\", \"command rm\" },
  }
else
  table.insert(M.CmdStorm.alias, { \"rm\", \"echo 为防止误操作，请使用murder\" })
  table.insert(M.CmdStorm.alias, { \"murder\", \"command rm\" })
end
if not M.CmdStorm.fish_greeting then
  M.CmdStorm.fish_greeting = \"new\"
end -- 由" (realpath (status current-filename)) 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path, conceal info(or simply a `sed`), not a function?!(relative 学习咒语)
    else
        return 2
    end
    生成配置
end
