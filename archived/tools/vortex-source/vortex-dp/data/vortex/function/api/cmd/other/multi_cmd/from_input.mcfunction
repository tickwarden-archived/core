# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/from_input
# Execute a simple command list (backward compatible)
#
# INPUT (storage vortex:input):
# list → command list ["cmd1", "cmd2", ...]
#
# EXAMPLE:
# data modify storage vortex:input list set value ["say Hello", "say World"]
# function vortex:api/cmd/other/multi_cmd/from_input
# ─────────────────────────────────────────────────────────────────

# Copy list to queue
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.from_input"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
data modify storage vortex:engine _mcmd_queue set from storage vortex:input list

# Set default options
data modify storage vortex:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}

# Execute
function vortex:api/cmd/other/multi_cmd/run
