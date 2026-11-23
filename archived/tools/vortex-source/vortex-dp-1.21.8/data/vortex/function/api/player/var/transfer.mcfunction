# vortex:api/player/var/transfer [MACRO]
$execute store result score $tr_f vortex.tmp run data get storage vortex:engine players.$(from).$(key)
$scoreboard players set $tr_a vortex.tmp $(amount)
scoreboard players operation $tr_f vortex.tmp -= $tr_a vortex.tmp
$execute store result storage vortex:engine players.$(from).$(key) int 1 run scoreboard players get $tr_f vortex.tmp

$execute store result score $tr_t vortex.tmp run data get storage vortex:engine players.$(to).$(key)
scoreboard players operation $tr_t vortex.tmp += $tr_a vortex.tmp
$execute store result storage vortex:engine players.$(to).$(key) int 1 run scoreboard players get $tr_t vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $tr_t vortex.tmp
