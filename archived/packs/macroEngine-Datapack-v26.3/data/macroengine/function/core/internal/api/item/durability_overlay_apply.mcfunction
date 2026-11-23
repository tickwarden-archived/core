# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/item/durability_overlay_apply
# Internal — do not call directly. Second pass of api/item/durability_overlay.
# Expects: {player:"...",slot:"...",macroengine:{...}}

function macroengine:core/internal/api/item/_slot_map with storage macroengine:item_tmp
function macroengine:core/internal/api/item/_custom_data_apply with storage macroengine:item_tmp
