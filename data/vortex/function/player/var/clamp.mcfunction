# vortex:player/var/clamp [MACRO]
$execute store result score $cv vortex.tmp run data get storage vortex:engine players.$(player).$(key)
$scoreboard players set $cv_mn vortex.tmp $(min)
$scoreboard players set $cv_mx vortex.tmp $(max)
execute if score $cv vortex.tmp < $cv_mn vortex.tmp run scoreboard players operation $cv vortex.tmp = $cv_mn vortex.tmp
execute if score $cv vortex.tmp > $cv_mx vortex.tmp run scoreboard players operation $cv vortex.tmp = $cv_mx vortex.tmp
$execute store result storage vortex:engine players.$(player).$(key) int 1 run scoreboard players get $cv vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $cv vortex.tmp
