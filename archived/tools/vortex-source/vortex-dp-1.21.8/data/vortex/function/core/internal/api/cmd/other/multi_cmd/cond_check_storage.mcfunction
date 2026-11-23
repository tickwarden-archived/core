# vortex:core/internal/api/cmd/other/multi_cmd/cond_check_storage
# Existence-only storage leaf, kept for backward compatibility:
#   condition.storage = "namespace:path"
#
# To compare a VALUE use the `data` leaf instead — it supports numeric
# ranges and also fails closed when the path is missing.

function vortex:core/internal/api/cmd/other/multi_cmd/cond_storage_exec with storage vortex:engine _mcmd_cond_eval
