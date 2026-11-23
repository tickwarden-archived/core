# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/item/hidden_flag_apply
# Internal — do not call directly. Second pass of api/item/hidden_flag.
# Expects: {player:"...",slot:"...",vortex:{...}}

function vortex:core/internal/api/item/_slot_map with storage vortex:item_tmp
function vortex:core/internal/api/item/_custom_data_apply with storage vortex:item_tmp
