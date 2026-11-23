# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/block/_default_take [INTERNAL]
# Default take: removes the stack of macroengine:input slot (default: first occupied slot) and
# writes it to macroengine:output block.item.
execute unless data storage macroengine:container tmp.k.slot run function macroengine:core/internal/api/container/_src_first with storage macroengine:container tmp.k
execute unless data storage macroengine:container tmp.k.slot run return 0
data modify storage macroengine:input slot set from storage macroengine:container tmp.k.slot
function macroengine:core/internal/api/container/slot_get_do
execute unless data storage macroengine:output container.item run return 0
data modify storage macroengine:block tmp.item set from storage macroengine:output container.item
function macroengine:core/internal/api/container/slot_clear_do
data modify storage macroengine:output block.item set from storage macroengine:block tmp.item
return 1
