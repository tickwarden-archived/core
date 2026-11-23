# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute if data storage guikit:work cost_fail_msg run tellraw @s [{"text":"[guikit] ","color":"gold"},{"nbt":"cost_fail_msg","storage":"guikit:work","color":"red"}]
execute unless data storage guikit:work cost_fail_msg run tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"Not enough resources.","color":"red"}]
scoreboard players set @s guikit.click 2
