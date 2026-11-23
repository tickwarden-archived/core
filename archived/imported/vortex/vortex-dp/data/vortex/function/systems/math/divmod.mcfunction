# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/divmod [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $dvm_v vortex.tmp $(value)
$scoreboard players set $dvm_d vortex.tmp $(divisor)

execute if score $dvm_d vortex.tmp matches ..0 run data modify storage vortex:output quotient set value 0
execute if score $dvm_d vortex.tmp matches ..0 run data modify storage vortex:output remainder set value 0
execute if score $dvm_d vortex.tmp matches ..0 run return 0

scoreboard players operation $dvm_q vortex.tmp = $dvm_v vortex.tmp
scoreboard players operation $dvm_q vortex.tmp /= $dvm_d vortex.tmp
execute store result storage vortex:output quotient int 1 run scoreboard players get $dvm_q vortex.tmp

scoreboard players operation $dvm_v vortex.tmp %= $dvm_d vortex.tmp
execute if score $dvm_v vortex.tmp matches ..-1 run scoreboard players operation $dvm_v vortex.tmp += $dvm_d vortex.tmp
execute store result storage vortex:output remainder int 1 run scoreboard players get $dvm_v vortex.tmp
