# vortex:systems/math/vec/internal/add_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

$scoreboard players set $vx vortex.tmp $(ax)
$scoreboard players set $vy vortex.tmp $(ay)
$scoreboard players set $vz vortex.tmp $(az)
$scoreboard players add $vx vortex.tmp $(bx)
$scoreboard players add $vy vortex.tmp $(by)
$scoreboard players add $vz vortex.tmp $(bz)

execute store result storage vortex:output x int 1 run scoreboard players get $vx vortex.tmp
execute store result storage vortex:output y int 1 run scoreboard players get $vy vortex.tmp
execute store result storage vortex:output z int 1 run scoreboard players get $vz vortex.tmp
