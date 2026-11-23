# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/cmd/other/multi_cmd/cond_check_storage
# Existence-only storage leaf, kept for backward compatibility:
#   condition.storage = "namespace:path"
#
# To compare a VALUE use the `data` leaf instead — it supports numeric
# ranges and also fails closed when the path is missing.

function macroengine:core/internal/api/cmd/other/multi_cmd/cond_storage_exec with storage macroengine:engine _mcmd_cond_eval
