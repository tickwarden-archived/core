# vortex:api/player/var/decrement [MACRO]
$execute store result score $pvar vortex.tmp run data get storage vortex:engine players.$(player).$(key)
scoreboard players remove $pvar vortex.tmp 1
$execute store result storage vortex:engine players.$(player).$(key) int 1 run scoreboard players get $pvar vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $pvar vortex.tmp
