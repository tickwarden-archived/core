# vortex:systems/lib/repeat/run [MACRO]
$data modify storage vortex:engine _repeat.func set value "$(func)"
$scoreboard players set $rep_n vortex.tmp $(count)
scoreboard players set $rep_i vortex.tmp 0
execute store result storage vortex:engine _repeat.i int 1 run scoreboard players get $rep_i vortex.tmp
execute store result storage vortex:engine _repeat.remaining int 1 run scoreboard players get $rep_n vortex.tmp
function vortex:core/internal/core/lib/repeat/run
data remove storage vortex:engine _repeat
