# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/advanced/internal/sort_append_loop
# Recursive: drain _sort_tmp into _mcmd_queue one item at a time.
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine _sort_tmp[0] run return 0

data modify storage vortex:engine _mcmd_queue append from storage vortex:engine _sort_tmp[0]
data remove storage vortex:engine _sort_tmp[0]

function vortex:core/internal/api/cmd/other/multi_cmd/advanced/sort_append_loop
