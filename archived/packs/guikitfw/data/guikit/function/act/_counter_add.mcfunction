# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key)
$scoreboard players operation @s $(key) += #delta guikit.tmp
$execute if score @s $(key) > #max guikit.tmp run scoreboard players operation @s $(key) = #max guikit.tmp
$execute if score @s $(key) < #min guikit.tmp run scoreboard players operation @s $(key) = #min guikit.tmp
