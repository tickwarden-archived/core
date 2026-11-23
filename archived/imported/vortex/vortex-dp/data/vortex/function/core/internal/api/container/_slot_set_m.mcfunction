# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_slot_set_m [INTERNAL, MACRO: x, y, z, slot]
$execute unless data block $(x) $(y) $(z) Items run return 0
$data remove block $(x) $(y) $(z) Items[{Slot:$(slot)b}]
$execute store success score #ct_ok vortex.tmp run data modify block $(x) $(y) $(z) Items append from storage vortex:container tmp.item
execute if score #ct_ok vortex.tmp matches 1 run data modify storage vortex:output container.ok set value 1b
return run scoreboard players get #ct_ok vortex.tmp
