# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/wrap [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $wrap_v vortex.tmp $(value)
$scoreboard players set $wrap_min vortex.tmp $(min)
$scoreboard players set $wrap_max vortex.tmp $(max)

scoreboard players operation $wrap_r vortex.tmp = $wrap_max vortex.tmp
scoreboard players operation $wrap_r vortex.tmp -= $wrap_min vortex.tmp

execute if score $wrap_r vortex.tmp matches ..0 run execute store result storage vortex:output result int 1 run scoreboard players get $wrap_min vortex.tmp
execute if score $wrap_r vortex.tmp matches ..0 run return 0

scoreboard players operation $wrap_off vortex.tmp = $wrap_v vortex.tmp
scoreboard players operation $wrap_off vortex.tmp -= $wrap_min vortex.tmp

scoreboard players operation $wrap_off vortex.tmp %= $wrap_r vortex.tmp
execute if score $wrap_off vortex.tmp matches ..-1 run scoreboard players operation $wrap_off vortex.tmp += $wrap_r vortex.tmp

scoreboard players operation $wrap_off vortex.tmp += $wrap_min vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $wrap_off vortex.tmp
