# vortex:core/internal/api/container/_ff_loop [INTERNAL, MACRO: x, y, z, i]
# First slot below #ct_size without an item, searching from i. RETURN the slot, or -1 when full.
$execute unless data block $(x) $(y) $(z) Items[{Slot:$(i)b}] run return $(i)
scoreboard players add #ct_i vortex.tmp 1
execute if score #ct_i vortex.tmp >= #ct_size vortex.tmp run return -1
execute store result storage vortex:container tmp.f.i int 1 run scoreboard players get #ct_i vortex.tmp
return run function vortex:core/internal/api/container/_ff_loop with storage vortex:container tmp.f
