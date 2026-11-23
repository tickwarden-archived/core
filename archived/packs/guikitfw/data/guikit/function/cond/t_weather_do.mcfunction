# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(wx)
$execute unless predicate guikit:weather_$(wx) run scoreboard players set #cond guikit.tmp 0
