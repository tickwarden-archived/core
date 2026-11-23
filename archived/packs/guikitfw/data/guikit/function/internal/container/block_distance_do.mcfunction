# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(x) $(y) $(z)
$execute positioned $(x) $(y) $(z) unless entity @s[distance=..8] run scoreboard players set #far guikit.tmp 1
