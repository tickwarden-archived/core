# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cb/time_left
# ─────────────────────────────────────────────────────────────────
# Reports how long until the NEXT pending entry of one run_delayed /
# run_sequence / run_repeating call fires. Read-only: the queue is not changed.
#
# INPUT  (storage vortex:input cb):
#   id      (int)  — the cb_id returned by the scheduling call  [REQUIRED, >= 1]
#
# OUTPUT (storage vortex:output):
#   cb_time_left  (int)  — ticks until the next entry of that id fires, or -1 when none is pending
#   cb_pending    (int)  — how many entries of that id are still queued (0 once everything fired)
#
# RETURN 1 when at least one entry is pending, else 0.
# The id is read as a number and compared on a scoreboard; it is never pasted into a macro.
# Entries pushed back by the fire spacing (see docs/cb.md) report their current counter.
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmd:"say hi",delay:100}
#   function vortex:api/cb/run_delayed
#   data modify storage vortex:input cb.id set from storage vortex:output cb_id
#   function vortex:api/cb/time_left
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.id run function vortex:systems/dbg/err {src:"cb",msg:"cb.id not set"}
execute unless data storage vortex:input cb.id run return 0
scoreboard players set #cb_cid vortex.tmp 0
execute store result score #cb_cid vortex.tmp run data get storage vortex:input cb.id
data remove storage vortex:input cb
data modify storage vortex:output cb_time_left set value -1
data modify storage vortex:output cb_pending set value 0
execute unless score #cb_cid vortex.tmp matches 1.. run return 0

scoreboard players set #cb_tcount vortex.tmp 0
scoreboard players set #cb_tmin vortex.tmp -1
data modify storage vortex:engine _cb_twork set from storage vortex:engine cb_queue
execute if data storage vortex:engine _cb_twork[0] run function vortex:core/internal/systems/cb/time_left_step
data remove storage vortex:engine _cb_twork
data remove storage vortex:engine _cb_tentry
execute store result storage vortex:output cb_pending int 1 run scoreboard players get #cb_tcount vortex.tmp
execute store result storage vortex:output cb_time_left int 1 run scoreboard players get #cb_tmin vortex.tmp
execute if score #cb_tcount vortex.tmp matches 1.. run return 1
return 0
