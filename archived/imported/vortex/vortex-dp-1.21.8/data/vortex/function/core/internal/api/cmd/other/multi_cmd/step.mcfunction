# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/internal/step
# Dequeue one command and execute it, then recurse
# ─────────────────────────────────────────────────────────────────

# Return if queue is empty
execute unless data storage vortex:engine _mcmd_queue[0] run return 0

# Dequeue first command
data modify storage vortex:engine _mcmd_current set from storage vortex:engine _mcmd_queue[0]
data remove storage vortex:engine _mcmd_queue[0]

# Increment stats counter
execute if data storage vortex:engine _mcmd_options{profile:1b} run scoreboard players add $mcmd_total vortex.tmp 1

# Execute command (string or object)
execute if data storage vortex:engine _mcmd_current{} run function vortex:core/internal/api/cmd/other/multi_cmd/exec_object
execute unless data storage vortex:engine _mcmd_current{} run function vortex:core/internal/api/cmd/other/multi_cmd/exec_string

# Process next command
function vortex:core/internal/api/cmd/other/multi_cmd/step
