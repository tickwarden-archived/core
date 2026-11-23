# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/ceil_div [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $cdv_a vortex.tmp $(a)
$scoreboard players set $cdv_b vortex.tmp $(b)

scoreboard players operation $cdv_t vortex.tmp = $cdv_b vortex.tmp
scoreboard players remove $cdv_t vortex.tmp 1

scoreboard players operation $cdv_a vortex.tmp += $cdv_t vortex.tmp

scoreboard players operation $cdv_a vortex.tmp /= $cdv_b vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $cdv_a vortex.tmp
