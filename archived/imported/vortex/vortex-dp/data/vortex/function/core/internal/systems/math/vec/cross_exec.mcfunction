# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/vec/cross_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

# cx = ay*bz - az*by
$scoreboard players set $vcay vortex.tmp $(ay)
$scoreboard players set $vcbz vortex.tmp $(bz)
scoreboard players operation $vcay vortex.tmp *= $vcbz vortex.tmp

$scoreboard players set $vcaz vortex.tmp $(az)
$scoreboard players set $vcby vortex.tmp $(by)
scoreboard players operation $vcaz vortex.tmp *= $vcby vortex.tmp

scoreboard players operation $vcay vortex.tmp -= $vcaz vortex.tmp
execute store result storage vortex:output x int 1 run scoreboard players get $vcay vortex.tmp

# cy = az*bx - ax*bz
$scoreboard players set $vcaz2 vortex.tmp $(az)
$scoreboard players set $vcbx vortex.tmp $(bx)
scoreboard players operation $vcaz2 vortex.tmp *= $vcbx vortex.tmp

$scoreboard players set $vcax vortex.tmp $(ax)
$scoreboard players set $vcbz2 vortex.tmp $(bz)
scoreboard players operation $vcax vortex.tmp *= $vcbz2 vortex.tmp

scoreboard players operation $vcaz2 vortex.tmp -= $vcax vortex.tmp
execute store result storage vortex:output y int 1 run scoreboard players get $vcaz2 vortex.tmp

# cz = ax*by - ay*bx
$scoreboard players set $vcax2 vortex.tmp $(ax)
$scoreboard players set $vcby2 vortex.tmp $(by)
scoreboard players operation $vcax2 vortex.tmp *= $vcby2 vortex.tmp

$scoreboard players set $vcay2 vortex.tmp $(ay)
$scoreboard players set $vcbx2 vortex.tmp $(bx)
scoreboard players operation $vcay2 vortex.tmp *= $vcbx2 vortex.tmp

scoreboard players operation $vcax2 vortex.tmp -= $vcay2 vortex.tmp
execute store result storage vortex:output z int 1 run scoreboard players get $vcax2 vortex.tmp
