# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_src_first [INTERNAL, MACRO: x, y, z]
# Writes the slot of the first occupied entry to vortex:container tmp.k.slot (nothing if empty).
$execute unless data block $(x) $(y) $(z) Items[0] run return 0
$execute store result storage vortex:container tmp.k.slot int 1 run data get block $(x) $(y) $(z) Items[0].Slot
return 1
