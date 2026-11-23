# vortex:api/cooldown/detail [MACRO]
data merge storage vortex:output {active:0b,remaining:0,expires:0}

$execute unless data storage vortex:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cdd_exp vortex.tmp run data get storage vortex:engine cooldowns.$(player).$(key)
execute store result storage vortex:output expires int 1 run scoreboard players get $cdd_exp vortex.tmp

execute store result score $cdd_now vortex.tmp run scoreboard players get $epoch vortex.time

execute if score $cdd_now vortex.tmp < $cdd_exp vortex.tmp run data modify storage vortex:output active set value 1b

scoreboard players operation $cdd_exp vortex.tmp -= $cdd_now vortex.tmp
execute if score $cdd_exp vortex.tmp matches 1.. run execute store result storage vortex:output remaining int 1 run scoreboard players get $cdd_exp vortex.tmp
