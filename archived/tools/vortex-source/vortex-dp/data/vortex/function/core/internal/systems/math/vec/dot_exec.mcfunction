# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/vec/dot_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

$scoreboard players set $vdax vortex.tmp $(ax)
$scoreboard players set $vdbx vortex.tmp $(bx)
scoreboard players operation $vdax vortex.tmp *= $vdbx vortex.tmp

$scoreboard players set $vday vortex.tmp $(ay)
$scoreboard players set $vdby vortex.tmp $(by)
scoreboard players operation $vday vortex.tmp *= $vdby vortex.tmp

$scoreboard players set $vdaz vortex.tmp $(az)
$scoreboard players set $vdbz vortex.tmp $(bz)
scoreboard players operation $vdaz vortex.tmp *= $vdbz vortex.tmp

scoreboard players operation $vdax vortex.tmp += $vday vortex.tmp
scoreboard players operation $vdax vortex.tmp += $vdaz vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $vdax vortex.tmp
