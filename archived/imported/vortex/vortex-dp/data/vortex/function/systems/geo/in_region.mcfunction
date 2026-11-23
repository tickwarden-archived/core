# vortex:systems/geo/in_region [MACRO]
execute if data storage vortex:engine modules{geo:0b} run return 0
data modify storage vortex:output result set value 0b

$scoreboard players set $rgn_x vortex.tmp $(x)
$scoreboard players set $rgn_y vortex.tmp $(y)
$scoreboard players set $rgn_z vortex.tmp $(z)
$scoreboard players set $rgn_x1 vortex.tmp $(x1)
$scoreboard players set $rgn_y1 vortex.tmp $(y1)
$scoreboard players set $rgn_z1 vortex.tmp $(z1)
$scoreboard players set $rgn_x2 vortex.tmp $(x2)
$scoreboard players set $rgn_y2 vortex.tmp $(y2)
$scoreboard players set $rgn_z2 vortex.tmp $(z2)

# min/max normalization
execute if score $rgn_x1 vortex.tmp > $rgn_x2 vortex.tmp run scoreboard players operation $rgn_t vortex.tmp = $rgn_x1 vortex.tmp
execute if score $rgn_x1 vortex.tmp > $rgn_x2 vortex.tmp run scoreboard players operation $rgn_x1 vortex.tmp = $rgn_x2 vortex.tmp
execute if score $rgn_t vortex.tmp > $rgn_x2 vortex.tmp run scoreboard players operation $rgn_x2 vortex.tmp = $rgn_t vortex.tmp

execute if score $rgn_y1 vortex.tmp > $rgn_y2 vortex.tmp run scoreboard players operation $rgn_t vortex.tmp = $rgn_y1 vortex.tmp
execute if score $rgn_y1 vortex.tmp > $rgn_y2 vortex.tmp run scoreboard players operation $rgn_y1 vortex.tmp = $rgn_y2 vortex.tmp
execute if score $rgn_t vortex.tmp > $rgn_y2 vortex.tmp run scoreboard players operation $rgn_y2 vortex.tmp = $rgn_t vortex.tmp

execute if score $rgn_z1 vortex.tmp > $rgn_z2 vortex.tmp run scoreboard players operation $rgn_t vortex.tmp = $rgn_z1 vortex.tmp
execute if score $rgn_z1 vortex.tmp > $rgn_z2 vortex.tmp run scoreboard players operation $rgn_z1 vortex.tmp = $rgn_z2 vortex.tmp
execute if score $rgn_t vortex.tmp > $rgn_z2 vortex.tmp run scoreboard players operation $rgn_z2 vortex.tmp = $rgn_t vortex.tmp

execute if score $rgn_x vortex.tmp < $rgn_x1 vortex.tmp run return 0
execute if score $rgn_x vortex.tmp > $rgn_x2 vortex.tmp run return 0
execute if score $rgn_y vortex.tmp < $rgn_y1 vortex.tmp run return 0
execute if score $rgn_y vortex.tmp > $rgn_y2 vortex.tmp run return 0
execute if score $rgn_z vortex.tmp < $rgn_z1 vortex.tmp run return 0
execute if score $rgn_z vortex.tmp > $rgn_z2 vortex.tmp run return 0

data modify storage vortex:output result set value 1b
