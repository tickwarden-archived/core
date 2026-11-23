# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/math/pow [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $pow_a vortex.tmp $(a)
$scoreboard players set $pow_n vortex.tmp $(n)
scoreboard players set $pow_r vortex.tmp 1

execute if score $pow_n vortex.tmp matches 0 run execute store result storage vortex:output result int 1 run scoreboard players get $pow_r vortex.tmp
execute if score $pow_n vortex.tmp matches 0 run return 0

function vortex:core/internal/systems/math/pow_loop
execute store result storage vortex:output result int 1 run scoreboard players get $pow_r vortex.tmp
