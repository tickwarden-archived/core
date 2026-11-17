# vortex:core/internal/api/block/_default_insert [INTERNAL]
# Default insert: the item goes into the first free slot (the slot used is written to vortex:input slot).
execute unless data storage vortex:input item.id run return 0
scoreboard players set #vortex.chk vortex.tmp 0
execute store result score #vortex.chk vortex.tmp run function vortex:core/internal/api/container/_size_pick {src:"tmp.k",ovr:"size"}
execute unless score #vortex.chk vortex.tmp matches 1.. run return 0
data modify storage vortex:container tmp.f set value {}
data modify storage vortex:container tmp.f.x set from storage vortex:container tmp.k.x
data modify storage vortex:container tmp.f.y set from storage vortex:container tmp.k.y
data modify storage vortex:container tmp.f.z set from storage vortex:container tmp.k.z
data modify storage vortex:container tmp.f.i set value 0
scoreboard players set #ct_i vortex.tmp 0
execute store result score #ct_ff vortex.tmp run function vortex:core/internal/api/container/_ff_loop with storage vortex:container tmp.f
execute if score #ct_ff vortex.tmp matches ..-1 run return 0
execute store result storage vortex:input slot int 1 run scoreboard players get #ct_ff vortex.tmp
return run function vortex:core/internal/api/container/slot_set_do
