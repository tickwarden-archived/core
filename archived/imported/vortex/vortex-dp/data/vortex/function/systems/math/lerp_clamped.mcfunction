# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/lerp_clamped [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $lc_a vortex.tmp $(a)
$scoreboard players set $lc_b vortex.tmp $(b)
$scoreboard players set $lc_t vortex.tmp $(t)

execute if score $lc_t vortex.tmp matches ..-1 run scoreboard players set $lc_t vortex.tmp 0
scoreboard players set $lc_100 vortex.tmp 100
execute if score $lc_t vortex.tmp > $lc_100 vortex.tmp run scoreboard players operation $lc_t vortex.tmp = $lc_100 vortex.tmp

scoreboard players operation $lc_r vortex.tmp = $lc_b vortex.tmp
scoreboard players operation $lc_r vortex.tmp -= $lc_a vortex.tmp

scoreboard players operation $lc_r vortex.tmp *= $lc_t vortex.tmp
scoreboard players operation $lc_r vortex.tmp /= $lc_100 vortex.tmp
scoreboard players operation $lc_r vortex.tmp += $lc_a vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $lc_r vortex.tmp
