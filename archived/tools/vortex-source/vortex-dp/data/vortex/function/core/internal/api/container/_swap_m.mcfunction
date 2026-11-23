# vortex:core/internal/api/container/_swap_m [INTERNAL, MACRO: x, y, z, slot, slot2]
$execute unless data block $(x) $(y) $(z) Items run return 0
data remove storage vortex:container tmp.a
data remove storage vortex:container tmp.b
$data modify storage vortex:container tmp.a set from block $(x) $(y) $(z) Items[{Slot:$(slot)b}]
$data modify storage vortex:container tmp.b set from block $(x) $(y) $(z) Items[{Slot:$(slot2)b}]
$data remove block $(x) $(y) $(z) Items[{Slot:$(slot)b}]
$data remove block $(x) $(y) $(z) Items[{Slot:$(slot2)b}]
execute if data storage vortex:container tmp.a store result storage vortex:container tmp.a.Slot byte 1 run data get storage vortex:container tmp.k.slot2
execute if data storage vortex:container tmp.b store result storage vortex:container tmp.b.Slot byte 1 run data get storage vortex:container tmp.k.slot
$execute if data storage vortex:container tmp.a run data modify block $(x) $(y) $(z) Items append from storage vortex:container tmp.a
$execute if data storage vortex:container tmp.b run data modify block $(x) $(y) $(z) Items append from storage vortex:container tmp.b
data modify storage vortex:output container.ok set value 1b
return 1
