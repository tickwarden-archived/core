# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/vec/sub_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

$scoreboard players set $vx vortex.tmp $(ax)
$scoreboard players set $vy vortex.tmp $(ay)
$scoreboard players set $vz vortex.tmp $(az)
$scoreboard players remove $vx vortex.tmp $(bx)
$scoreboard players remove $vy vortex.tmp $(by)
$scoreboard players remove $vz vortex.tmp $(bz)

execute store result storage vortex:output x int 1 run scoreboard players get $vx vortex.tmp
execute store result storage vortex:output y int 1 run scoreboard players get $vy vortex.tmp
execute store result storage vortex:output z int 1 run scoreboard players get $vz vortex.tmp
