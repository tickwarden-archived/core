# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroEngine player module — zero every event counter after dispatch so
# each statistic fires at most once per tick.

scoreboard players set @s player_action.fly 0
scoreboard players set @s player_action.walk 0
scoreboard players set @s player_action.fall 0
scoreboard players set @s player_action.climb 0
scoreboard players set @s player_action.aviate 0

scoreboard players set @s player_action.death 0
scoreboard players set @s player_action.enchant 0
scoreboard players set @s player_action.jump 0
scoreboard players set @s player_action.use_coas 0
scoreboard players set @s player_action.use_wfoas 0
scoreboard players set @s player_action.join 0
