# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute if score @s guikit.cd matches 1.. run return 0
scoreboard players set #guard guikit.tmp 1
