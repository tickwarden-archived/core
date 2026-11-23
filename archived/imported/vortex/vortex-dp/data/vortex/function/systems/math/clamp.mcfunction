# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/clamp [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $clamp_v vortex.tmp $(value)
$scoreboard players set $clamp_lo vortex.tmp $(min)
$scoreboard players set $clamp_hi vortex.tmp $(max)

execute if score $clamp_v vortex.tmp < $clamp_lo vortex.tmp run scoreboard players operation $clamp_v vortex.tmp = $clamp_lo vortex.tmp
execute if score $clamp_v vortex.tmp > $clamp_hi vortex.tmp run scoreboard players operation $clamp_v vortex.tmp = $clamp_hi vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $clamp_v vortex.tmp
