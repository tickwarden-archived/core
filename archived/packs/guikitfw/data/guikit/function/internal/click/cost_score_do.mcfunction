# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(cscore)
$execute unless score @s $(cscore) >= #need guikit.tmp run scoreboard players set #cost_fail guikit.tmp 1
$execute if score #cost_fail guikit.tmp matches 0 run scoreboard players operation @s $(cscore) -= #need guikit.tmp
