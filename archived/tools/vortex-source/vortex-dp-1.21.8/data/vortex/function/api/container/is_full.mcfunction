# vortex:api/container/is_full
# Condition: is every slot of the container occupied?
# INPUT  vortex:input x, y, z, size (int 1..256, optional: needed for modded or unknown blocks;
#        known vanilla containers report their own size)
# RETURN 1 when every slot has an item, else 0. vortex:output container {ok}.
# "Full" means no free slot; a stack below its maximum count still counts as occupied.
execute if data storage vortex:engine modules{container:0b} run return 0
data modify storage vortex:output container set value {ok:0b}
execute unless function vortex:core/internal/api/container/_addr run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_count with storage vortex:container tmp.k
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_size_pick {src:"tmp.k",ovr:"size"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:output container.ok set value 1b
execute if score #ct_n vortex.tmp >= #ct_size vortex.tmp run return 1
return 0
