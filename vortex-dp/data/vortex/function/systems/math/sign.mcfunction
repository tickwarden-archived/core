# vortex:systems/math/sign [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $sign_v vortex.tmp $(value)
execute if score $sign_v vortex.tmp matches 1.. run data modify storage vortex:output result set value 1
execute if score $sign_v vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $sign_v vortex.tmp matches ..-1 run data modify storage vortex:output result set value -1
