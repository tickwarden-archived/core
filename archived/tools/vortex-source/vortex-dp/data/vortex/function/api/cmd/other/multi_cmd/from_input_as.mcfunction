# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/from_input_as
# Execute as a specific selector
#
# INPUT (storage vortex:input):
# list → command list
# selector → entity selector (default: @s)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.from_input_as"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
execute unless data storage vortex:input selector run data modify storage vortex:input selector set value "@s"

data modify storage vortex:engine _mcmd_queue set from storage vortex:input list
data modify storage vortex:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}

function vortex:core/internal/api/cmd/other/multi_cmd/run_as_exec with storage vortex:input
