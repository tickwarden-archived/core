# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/item/durability_overlay_apply
# Internal — do not call directly. Second pass of api/item/durability_overlay.
# Expects: {player:"...",slot:"...",vortex:{...}}

function vortex:core/internal/api/item/_slot_map with storage vortex:item_tmp
function vortex:core/internal/api/item/_custom_data_apply with storage vortex:item_tmp
