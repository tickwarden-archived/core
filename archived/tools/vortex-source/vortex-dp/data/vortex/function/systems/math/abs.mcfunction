# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/abs [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $abs_v vortex.tmp $(value)
scoreboard players set $abs_neg vortex.tmp -1
execute if score $abs_v vortex.tmp matches ..-1 run scoreboard players operation $abs_v vortex.tmp *= $abs_neg vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $abs_v vortex.tmp
