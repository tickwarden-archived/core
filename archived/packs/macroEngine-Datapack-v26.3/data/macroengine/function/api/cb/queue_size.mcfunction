# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/cb/queue_size
# ─────────────────────────────────────────────────────────────────
# Returns the number of pending delayed CB commands.
# Result is stored in score #cb_queue_size macroengine.tmp.
#
# EXAMPLE:
#   function macroengine:api/cb/queue_size
#   # read: scoreboard players get #cb_queue_size macroengine.tmp
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{cb:0b} run return 0
execute store result score #cb_queue_size macroengine.tmp run data get storage macroengine:engine cb_queue
