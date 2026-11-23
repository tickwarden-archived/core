# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/log2 [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $lg2_v vortex.tmp $(value)

execute if score $lg2_v vortex.tmp matches ..0 run data modify storage vortex:output result set value -1
execute if score $lg2_v vortex.tmp matches ..0 run return 0

scoreboard players set $lg2_r vortex.tmp 0
scoreboard players set $lg2_2 vortex.tmp 2

function vortex:core/internal/systems/math/log2_loop

execute store result storage vortex:output result int 1 run scoreboard players get $lg2_r vortex.tmp
