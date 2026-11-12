# vortex:api/cb/cancel
# ─────────────────────────────────────────────────────────────────
# Clears all pending delayed CB commands from the queue.
#
# No input required. Clears the entire queue.
#
# No permission gate — caller is trusted as-is.
#
# EXAMPLE:
#   function vortex:api/cb/cancel
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
data remove storage vortex:engine cb_queue
data modify storage vortex:engine cb_queue set value []
