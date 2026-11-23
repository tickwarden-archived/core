# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_slot_get_m [INTERNAL, MACRO: x, y, z, slot]
$execute unless data block $(x) $(y) $(z) Items run return 0
data modify storage vortex:output container.ok set value 1b
$execute if data block $(x) $(y) $(z) Items[{Slot:$(slot)b}] run data modify storage vortex:output container.empty set value 0b
$data modify storage vortex:output container.item set from block $(x) $(y) $(z) Items[{Slot:$(slot)b}]
return 1
