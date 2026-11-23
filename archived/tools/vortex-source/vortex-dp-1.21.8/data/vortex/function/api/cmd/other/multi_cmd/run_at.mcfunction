# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/run_at
# Run queue at a specific location
#
# INPUT (storage vortex:input):
# selector → entity selector
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.run_at"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
function vortex:core/internal/api/cmd/other/multi_cmd/run_at_exec with storage vortex:input
