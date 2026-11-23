# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_default_take [INTERNAL]
# Default take: removes the stack of vortex:input slot (default: first occupied slot) and
# writes it to vortex:output block.item.
execute unless data storage vortex:container tmp.k.slot run function vortex:core/internal/api/container/_src_first with storage vortex:container tmp.k
execute unless data storage vortex:container tmp.k.slot run return 0
data modify storage vortex:input slot set from storage vortex:container tmp.k.slot
function vortex:core/internal/api/container/slot_get_do
execute unless data storage vortex:output container.item run return 0
data modify storage vortex:block tmp.item set from storage vortex:output container.item
function vortex:core/internal/api/container/slot_clear_do
data modify storage vortex:output block.item set from storage vortex:block tmp.item
return 1
