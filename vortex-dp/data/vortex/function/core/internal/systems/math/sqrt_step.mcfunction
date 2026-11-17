# vortex:core/internal/systems/math/sqrt_step
scoreboard players operation $sqrt_mid vortex.tmp = $sqrt_lo vortex.tmp
scoreboard players operation $sqrt_mid vortex.tmp += $sqrt_hi vortex.tmp
scoreboard players set $sqrt_2 vortex.tmp 2
scoreboard players operation $sqrt_mid vortex.tmp /= $sqrt_2 vortex.tmp

scoreboard players operation $sqrt_sq vortex.tmp = $sqrt_mid vortex.tmp
scoreboard players operation $sqrt_sq vortex.tmp *= $sqrt_mid vortex.tmp

execute if score $sqrt_sq vortex.tmp <= $sqrt_n vortex.tmp run scoreboard players operation $sqrt_lo vortex.tmp = $sqrt_mid vortex.tmp
execute unless score $sqrt_sq vortex.tmp <= $sqrt_n vortex.tmp run scoreboard players operation $sqrt_hi vortex.tmp = $sqrt_mid vortex.tmp

scoreboard players remove $sqrt_itr vortex.tmp 1
execute if score $sqrt_itr vortex.tmp matches 1.. run function vortex:core/internal/systems/math/sqrt_step
