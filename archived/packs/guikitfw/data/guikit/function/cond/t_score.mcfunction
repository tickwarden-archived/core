# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# guikit:cond {type:"score", score:"obj", matches:"0..10"} or min/max
scoreboard players set #cond guikit.tmp 0
# Extension: authors implement precise match in override packs
scoreboard players set #cond guikit.tmp 1
