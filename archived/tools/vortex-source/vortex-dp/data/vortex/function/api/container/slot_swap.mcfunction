# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/container/slot_swap
# Swaps two slots of one container. An empty slot swaps too (the item moves).
# INPUT  vortex:input x, y, z, slot, slot2
# OUTPUT vortex:output container {ok}
# RETURN 1 on success, 0 on bad input or a block without an inventory.
execute if data storage vortex:engine modules{container:0b} run return 0
data modify storage vortex:output container set value {ok:0b}
execute unless data storage vortex:input slot run return 0
execute unless data storage vortex:input slot2 run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
execute store result score #ct_a vortex.tmp run data get storage vortex:container tmp.k.slot
execute store result score #ct_b vortex.tmp run data get storage vortex:container tmp.k.slot2
execute if score #ct_a vortex.tmp = #ct_b vortex.tmp run return run function vortex:core/internal/api/container/_exists with storage vortex:container tmp.k
return run function vortex:core/internal/api/container/_swap_m with storage vortex:container tmp.k
