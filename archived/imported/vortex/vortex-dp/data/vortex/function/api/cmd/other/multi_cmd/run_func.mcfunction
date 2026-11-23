# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/run_func
# Run function list
#
# INPUT (storage vortex:input):
# list → function list ["pack:func1", "pack:func2"]
# ─────────────────────────────────────────────────────────────────

# Convert strings to {func:"..."} format
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.run_func"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
data modify storage vortex:engine _mcmd_queue set value []
function vortex:core/internal/api/cmd/other/multi_cmd/func_convert_loop

data modify storage vortex:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}
function vortex:api/cmd/other/multi_cmd/run

data remove storage vortex:engine _mcmd_func_tmp
