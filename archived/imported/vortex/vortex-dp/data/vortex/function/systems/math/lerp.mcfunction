# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/lerp [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $lerp_a vortex.tmp $(a)
$scoreboard players set $lerp_b vortex.tmp $(b)
$scoreboard players set $lerp_t vortex.tmp $(t)

scoreboard players operation $lerp_r vortex.tmp = $lerp_b vortex.tmp
scoreboard players operation $lerp_r vortex.tmp -= $lerp_a vortex.tmp

scoreboard players operation $lerp_r vortex.tmp *= $lerp_t vortex.tmp
scoreboard players set $lerp_100 vortex.tmp 100
scoreboard players operation $lerp_r vortex.tmp /= $lerp_100 vortex.tmp
scoreboard players operation $lerp_r vortex.tmp += $lerp_a vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $lerp_r vortex.tmp
