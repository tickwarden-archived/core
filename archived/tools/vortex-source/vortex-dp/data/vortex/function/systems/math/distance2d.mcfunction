# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/distance2d [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $d2d_x1 vortex.tmp $(x1)
$scoreboard players set $d2d_z1 vortex.tmp $(z1)
$scoreboard players set $d2d_x2 vortex.tmp $(x2)
$scoreboard players set $d2d_z2 vortex.tmp $(z2)

scoreboard players operation $d2d_dx vortex.tmp = $d2d_x2 vortex.tmp
scoreboard players operation $d2d_dx vortex.tmp -= $d2d_x1 vortex.tmp

scoreboard players operation $d2d_dz vortex.tmp = $d2d_z2 vortex.tmp
scoreboard players operation $d2d_dz vortex.tmp -= $d2d_z1 vortex.tmp

# Overflow prevention: 2 * 32767² = 2,147,354,578 ≤ INT_MAX (2,147,483,647)
execute if score $d2d_dx vortex.tmp matches 32768.. run scoreboard players set $d2d_dx vortex.tmp 32767
execute if score $d2d_dx vortex.tmp matches ..-32768 run scoreboard players set $d2d_dx vortex.tmp -32767
execute if score $d2d_dz vortex.tmp matches 32768.. run scoreboard players set $d2d_dz vortex.tmp 32767
execute if score $d2d_dz vortex.tmp matches ..-32768 run scoreboard players set $d2d_dz vortex.tmp -32767

scoreboard players operation $d2d_dx vortex.tmp *= $d2d_dx vortex.tmp
scoreboard players operation $d2d_dz vortex.tmp *= $d2d_dz vortex.tmp
scoreboard players operation $d2d_sq vortex.tmp = $d2d_dx vortex.tmp
scoreboard players operation $d2d_sq vortex.tmp += $d2d_dz vortex.tmp

execute if score $d2d_sq vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $d2d_sq vortex.tmp matches 0 run return 0

scoreboard players operation $sqrt_n vortex.tmp = $d2d_sq vortex.tmp
scoreboard players set $sqrt_lo vortex.tmp 0
scoreboard players operation $sqrt_hi vortex.tmp = $sqrt_n vortex.tmp
execute if score $sqrt_hi vortex.tmp matches 46342.. run scoreboard players set $sqrt_hi vortex.tmp 46341
scoreboard players set $sqrt_itr vortex.tmp 16
function vortex:core/internal/systems/math/sqrt_step

execute store result storage vortex:output result int 1 run scoreboard players get $sqrt_lo vortex.tmp
