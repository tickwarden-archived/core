# vortex:systems/math/minmax [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $mmx_a vortex.tmp $(a)
$scoreboard players set $mmx_b vortex.tmp $(b)

scoreboard players operation $mmx_lo vortex.tmp = $mmx_a vortex.tmp
execute if score $mmx_b vortex.tmp < $mmx_a vortex.tmp run scoreboard players operation $mmx_lo vortex.tmp = $mmx_b vortex.tmp

scoreboard players operation $mmx_hi vortex.tmp = $mmx_a vortex.tmp
execute if score $mmx_b vortex.tmp > $mmx_a vortex.tmp run scoreboard players operation $mmx_hi vortex.tmp = $mmx_b vortex.tmp

execute store result storage vortex:output min int 1 run scoreboard players get $mmx_lo vortex.tmp
execute store result storage vortex:output max int 1 run scoreboard players get $mmx_hi vortex.tmp
