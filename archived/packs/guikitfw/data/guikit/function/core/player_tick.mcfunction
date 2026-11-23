# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# bind → click → vacuum → fill
execute if score @s guikit.mode matches 1 run function guikit:core/player_tick_block
execute unless score @s guikit.mode matches 1 run function guikit:core/player_tick_entity
