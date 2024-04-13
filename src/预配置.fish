function 预配置
    # TODO 如果用户的profile包含了所有这些，那么提示可以运行……不对，这一坨还是……不对，还是提示一下
    set -l preset $argv[1]
    test -z $preset && set preset base
    if test $preset = base; or test $preset = 基础
        # TODO 这重复地真离谱了，可恶，我需要merge！
        echo " -- 以下
M.zoxide = M.zoxide or {}
M.atuin = M.atuin or {}
M.starship = M.starship or {}
M.starship.preset = M.starship.preset or \"gruvbox-rainbow\"
M.CmdStorm = M.CmdStorm or {} -- 不过，应该运行过安装程序了吧？以防万一。
if not M.CmdStorm.alias then -- TODO deduplicate
  M.CmdStorm.alias = {
    { \"rm\", \"echo 为防止误操作，请使用murder\" },
    { \"murder\", \"command rm\" },
  }
else
  table.insert(M.CmdStorm.alias, { \"rm\", \"echo 为防止误操作，请使用murder\" })
  table.insert(M.CmdStorm.alias, { \"murder\", \"command rm\" })
end
M.CmdStorm.fish_greeting = M.CmdStorm.fish_greeting or \"new\"
-- 由" (realpath (status current-filename)) 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path, conceal info(or simply a `sed`), not a function?!(relative 学习咒语)
    else if test $preset = core; or test $preset = 核心
        echo " -- 以下
M.lazygit = M.lazygit or {}
M.lazygit.difft = M.lazygit.difft or {}
M.CmdStorm.fish_greeting = M.CmdStorm.fish_greeting or \"core\"
-- 由" (realpath (status current-filename)) 于 (date) 添加 >>~/.config/CmdStorm/lua/profile.raw.lua # TODO path, conceal info(or simply a `sed`), not a function?!(relative 学习咒语)
    else
        return 2
    end
    emit CmdStorm_profile_changed
end
