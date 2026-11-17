# vortex:core/internal/api/container/_size_pick [INTERNAL, MACRO: src, ovr]
# Sets #ct_size (vortex.tmp) from vortex:input <ovr> when given, else from the block
# at vortex:container <src> {x,y,z}. RETURN 1 when 1..256, else 0.
scoreboard players set #ct_size vortex.tmp 0
$execute if data storage vortex:input $(ovr) store result score #ct_size vortex.tmp run data get storage vortex:input $(ovr)
$execute unless data storage vortex:input $(ovr) store result score #ct_size vortex.tmp run function vortex:core/internal/api/container/_size with storage vortex:container $(src)
execute unless score #ct_size vortex.tmp matches 1..256 run return 0
return 1
