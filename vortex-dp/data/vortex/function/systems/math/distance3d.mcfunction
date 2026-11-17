# vortex:systems/math/distance3d [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $d3d_x1 vortex.tmp $(x1)
$scoreboard players set $d3d_y1 vortex.tmp $(y1)
$scoreboard players set $d3d_z1 vortex.tmp $(z1)
$scoreboard players set $d3d_x2 vortex.tmp $(x2)
$scoreboard players set $d3d_y2 vortex.tmp $(y2)
$scoreboard players set $d3d_z2 vortex.tmp $(z2)

scoreboard players operation $d3d_dx vortex.tmp = $d3d_x2 vortex.tmp
scoreboard players operation $d3d_dx vortex.tmp -= $d3d_x1 vortex.tmp

scoreboard players operation $d3d_dy vortex.tmp = $d3d_y2 vortex.tmp
scoreboard players operation $d3d_dy vortex.tmp -= $d3d_y1 vortex.tmp

scoreboard players operation $d3d_dz vortex.tmp = $d3d_z2 vortex.tmp
scoreboard players operation $d3d_dz vortex.tmp -= $d3d_z1 vortex.tmp

# Overflow prevention: 3 * 26754² = 2,147,329,548 ≤ INT_MAX (2,147,483,647)
execute if score $d3d_dx vortex.tmp matches 26755.. run scoreboard players set $d3d_dx vortex.tmp 26754
execute if score $d3d_dx vortex.tmp matches ..-26755 run scoreboard players set $d3d_dx vortex.tmp -26754
execute if score $d3d_dy vortex.tmp matches 26755.. run scoreboard players set $d3d_dy vortex.tmp 26754
execute if score $d3d_dy vortex.tmp matches ..-26755 run scoreboard players set $d3d_dy vortex.tmp -26754
execute if score $d3d_dz vortex.tmp matches 26755.. run scoreboard players set $d3d_dz vortex.tmp 26754
execute if score $d3d_dz vortex.tmp matches ..-26755 run scoreboard players set $d3d_dz vortex.tmp -26754

scoreboard players operation $d3d_dx vortex.tmp *= $d3d_dx vortex.tmp
scoreboard players operation $d3d_dy vortex.tmp *= $d3d_dy vortex.tmp
scoreboard players operation $d3d_dz vortex.tmp *= $d3d_dz vortex.tmp
scoreboard players operation $d3d_sq vortex.tmp = $d3d_dx vortex.tmp
scoreboard players operation $d3d_sq vortex.tmp += $d3d_dy vortex.tmp
scoreboard players operation $d3d_sq vortex.tmp += $d3d_dz vortex.tmp

execute if score $d3d_sq vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $d3d_sq vortex.tmp matches 0 run return 0

scoreboard players operation $sqrt_n vortex.tmp = $d3d_sq vortex.tmp
scoreboard players set $sqrt_lo vortex.tmp 0
scoreboard players operation $sqrt_hi vortex.tmp = $sqrt_n vortex.tmp
execute if score $sqrt_hi vortex.tmp matches 46342.. run scoreboard players set $sqrt_hi vortex.tmp 46341
scoreboard players set $sqrt_itr vortex.tmp 16
function vortex:core/internal/systems/math/sqrt_step

execute store result storage vortex:output result int 1 run scoreboard players get $sqrt_lo vortex.tmp
