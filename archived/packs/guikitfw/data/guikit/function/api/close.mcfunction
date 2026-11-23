# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute unless score @s guikit.timer matches 1.. run return 0
execute if score @s guikit.mode matches 1 run function guikit:api/close_block
execute unless score @s guikit.mode matches 1 run function guikit:api/close_entity
