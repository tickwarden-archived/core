# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key)
$execute if score @s $(key) matches 1 run scoreboard players set #tog guikit.tmp 0
$execute unless score @s $(key) matches 1 run scoreboard players set #tog guikit.tmp 1
$scoreboard players operation @s $(key) = #tog guikit.tmp
