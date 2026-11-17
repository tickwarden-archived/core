# vortex:systems/geo/in_sphere [MACRO]
execute if data storage vortex:engine modules{geo:0b} run return 0
data modify storage vortex:output result set value 0b

$scoreboard players set $sph_dx vortex.tmp $(x)
$scoreboard players set $sph_cx vortex.tmp $(cx)
scoreboard players operation $sph_dx vortex.tmp -= $sph_cx vortex.tmp

$scoreboard players set $sph_dy vortex.tmp $(y)
$scoreboard players set $sph_cy vortex.tmp $(cy)
scoreboard players operation $sph_dy vortex.tmp -= $sph_cy vortex.tmp

$scoreboard players set $sph_dz vortex.tmp $(z)
$scoreboard players set $sph_cz vortex.tmp $(cz)
scoreboard players operation $sph_dz vortex.tmp -= $sph_cz vortex.tmp

# Overflow prevention (max 26754 per axis)
execute if score $sph_dx vortex.tmp matches 26755.. run scoreboard players set $sph_dx vortex.tmp 26754
execute if score $sph_dx vortex.tmp matches ..-26755 run scoreboard players set $sph_dx vortex.tmp -26754
execute if score $sph_dy vortex.tmp matches 26755.. run scoreboard players set $sph_dy vortex.tmp 26754
execute if score $sph_dy vortex.tmp matches ..-26755 run scoreboard players set $sph_dy vortex.tmp -26754
execute if score $sph_dz vortex.tmp matches 26755.. run scoreboard players set $sph_dz vortex.tmp 26754
execute if score $sph_dz vortex.tmp matches ..-26755 run scoreboard players set $sph_dz vortex.tmp -26754

scoreboard players operation $sph_dx vortex.tmp *= $sph_dx vortex.tmp
scoreboard players operation $sph_dy vortex.tmp *= $sph_dy vortex.tmp
scoreboard players operation $sph_dz vortex.tmp *= $sph_dz vortex.tmp

scoreboard players operation $sph_dsq vortex.tmp = $sph_dx vortex.tmp
scoreboard players operation $sph_dsq vortex.tmp += $sph_dy vortex.tmp
scoreboard players operation $sph_dsq vortex.tmp += $sph_dz vortex.tmp
execute store result storage vortex:output dist_sq int 1 run scoreboard players get $sph_dsq vortex.tmp

$scoreboard players set $sph_r vortex.tmp $(r)
scoreboard players operation $sph_r vortex.tmp *= $sph_r vortex.tmp

execute if score $sph_dsq vortex.tmp <= $sph_r vortex.tmp run data modify storage vortex:output result set value 1b
