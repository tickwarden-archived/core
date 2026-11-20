# vortex:api/cb/queue_size
# ─────────────────────────────────────────────────────────────────
# Returns the number of pending delayed CB commands.
# Result is stored in score #cb_queue_size vortex.tmp.
#
# EXAMPLE:
#   function vortex:api/cb/queue_size
#   # read: scoreboard players get #cb_queue_size vortex.tmp
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
execute store result score #cb_queue_size vortex.tmp run data get storage vortex:engine cb_queue
