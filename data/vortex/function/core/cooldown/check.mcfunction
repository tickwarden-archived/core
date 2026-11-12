# vortex:core/cooldown/check [MACRO]
data modify storage vortex:output result set value 1b

$execute unless data storage vortex:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cd_exp vortex.tmp run data get storage vortex:engine cooldowns.$(player).$(key)
execute store result score $cd_now vortex.tmp run scoreboard players get $epoch vortex.time

execute if score $cd_now vortex.tmp < $cd_exp vortex.tmp run data modify storage vortex:output result set value 0b
