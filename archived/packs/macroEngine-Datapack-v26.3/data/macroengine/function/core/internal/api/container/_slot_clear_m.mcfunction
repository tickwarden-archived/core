# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/container/_slot_clear_m [INTERNAL, MACRO: x, y, z, slot]
$execute unless data block $(x) $(y) $(z) Items run return 0
$data remove block $(x) $(y) $(z) Items[{Slot:$(slot)b}]
data modify storage macroengine:output container.ok set value 1b
return 1
