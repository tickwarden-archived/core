# vortex:api/cb/run_sequence
# ─────────────────────────────────────────────────────────────────
# Schedules a list of commands to run sequentially, each separated
# by a configurable interval.
#
# INPUT  (storage vortex:input cb):
#   cmds      (list of strings) — commands to run  [REQUIRED, min 1]
#   interval  (int)             — ticks between each command  [default: 2]
#   x         (int)             — CB block X  [default: 0]
#   y         (int)             — CB block Y  [default: -64]
#   z         (int)             — CB block Z  [default: 0]
#
# OUTPUT (storage vortex:output):
#   cb_id   (int)  — one id shared by every step; api/cb/cancel_id cancels the
#                     steps that have not fired yet
#
# No permission gate — caller is trusted as-is.
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmds:["say one","say two","say three"],interval:20}
#   function vortex:api/cb/run_sequence
# ─────────────────────────────────────────────────────────────────

# Verify required input
execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.cmds[0] run function vortex:systems/dbg/err {src:"cb",msg:"cb.cmds is empty or not set"}
execute unless data storage vortex:input cb.cmds[0] run return 0

# Fill defaults
function vortex:core/internal/api/cb/apply_defaults
execute unless data storage vortex:input cb.interval run data modify storage vortex:input cb.interval set value 2

# Expand cmds list into individual delayed queue entries
function vortex:core/internal/systems/cb/seq_expand
data remove storage vortex:input cb
