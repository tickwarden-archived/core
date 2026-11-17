# vortex:systems/math/mod [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $mod_v vortex.tmp $(value)
$scoreboard players set $mod_d vortex.tmp $(divisor)

execute if score $mod_d vortex.tmp matches ..0 run data modify storage vortex:output result set value 0
execute if score $mod_d vortex.tmp matches ..0 run return 0

scoreboard players operation $mod_v vortex.tmp %= $mod_d vortex.tmp

execute if score $mod_v vortex.tmp matches ..-1 run scoreboard players operation $mod_v vortex.tmp += $mod_d vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $mod_v vortex.tmp
