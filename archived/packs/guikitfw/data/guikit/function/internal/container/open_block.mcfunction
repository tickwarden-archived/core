# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
scoreboard players set #ok guikit.const 1
function guikit:internal/container/place_block
execute unless score @s guikit.mode matches 1 run scoreboard players set #ok guikit.const 0
