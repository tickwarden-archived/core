# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/cb/cancel
# ─────────────────────────────────────────────────────────────────
# Clears all pending delayed CB commands from the queue.
#
# No input required. Clears the entire queue.
#
# No permission gate — caller is trusted as-is.
#
# EXAMPLE:
#   function macroengine:api/cb/cancel
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{cb:0b} run return 0
data remove storage macroengine:engine cb_queue
data modify storage macroengine:engine cb_queue set value []
