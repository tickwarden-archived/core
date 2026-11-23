# vortex:systems/math/min [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $min_a vortex.tmp $(a)
$scoreboard players set $min_b vortex.tmp $(b)

execute store result storage vortex:output result int 1 run scoreboard players get $min_a vortex.tmp

execute if score $min_b vortex.tmp < $min_a vortex.tmp run execute store result storage vortex:output result int 1 run scoreboard players get $min_b vortex.tmp
