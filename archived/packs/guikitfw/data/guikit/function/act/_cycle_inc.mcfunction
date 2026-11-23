# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key)
$scoreboard players add @s $(key) 1
$execute if score @s $(key) > #max guikit.tmp run scoreboard players set @s $(key) 0
