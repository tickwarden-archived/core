# vortex:systems/math/max [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $max_a vortex.tmp $(a)
$scoreboard players set $max_b vortex.tmp $(b)

execute store result storage vortex:output result int 1 run scoreboard players get $max_a vortex.tmp

execute if score $max_b vortex.tmp > $max_a vortex.tmp run execute store result storage vortex:output result int 1 run scoreboard players get $max_b vortex.tmp
