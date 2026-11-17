# vortex:systems/hook/on_trade
# Advancement reward: runs when villager_trade triggers.
# @s = the trading player

execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/trade
scoreboard players add @s vortex.hook_traded 1
