# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_trade
# Advancement reward: runs when villager_trade triggers.
# @s = the trading player

execute if data storage macroengine:engine modules{hook:0b} run return 0
advancement revoke @s only macroengine:systems/hook/trade
scoreboard players add @s macroengine.hook_traded 1
