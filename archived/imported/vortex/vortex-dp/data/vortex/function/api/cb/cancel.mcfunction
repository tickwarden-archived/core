# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cb/cancel
# ─────────────────────────────────────────────────────────────────
# Clears all pending delayed CB commands from the queue.
#
# No input required. Clears the entire queue.
#
#
# EXAMPLE:
#   function vortex:api/cb/cancel
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
data remove storage vortex:engine cb_queue
data modify storage vortex:engine cb_queue set value []
