# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cb/cancel_id
# ─────────────────────────────────────────────────────────────────
# Cancels the pending entries of ONE run_delayed / run_sequence call
# (selective version of api/cb/cancel, which clears the whole queue).
#
# INPUT  (storage vortex:input cb):
#   id      (int)  — the cb_id returned by run_delayed / run_sequence  [REQUIRED, >= 1]
#
# OUTPUT (storage vortex:output):
#   cb_cancelled  (int)  — how many queued entries were removed (0 if it already fired)
#
# The id is read as a number and compared on a scoreboard; it is never
# pasted into a macro, so a non-numeric id cannot inject anything.
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmds:["say a","say b"],interval:20}
#   function vortex:api/cb/run_sequence
#   data modify storage vortex:input cb.id set from storage vortex:output cb_id
#   function vortex:api/cb/cancel_id
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.id run function vortex:systems/dbg/err {src:"cb",msg:"cb.id not set"}
execute unless data storage vortex:input cb.id run return 0
execute store result score #cb_cid vortex.tmp run data get storage vortex:input cb.id
data remove storage vortex:input cb
data modify storage vortex:output cb_cancelled set value 0
execute unless score #cb_cid vortex.tmp matches 1.. run return 0

scoreboard players set #cb_ccount vortex.tmp 0
data modify storage vortex:engine _cb_cwork set from storage vortex:engine cb_queue
data modify storage vortex:engine cb_queue set value []
execute if data storage vortex:engine _cb_cwork[0] run function vortex:core/internal/systems/cb/cancel_step
data remove storage vortex:engine _cb_cwork
execute store result storage vortex:output cb_cancelled int 1 run scoreboard players get #cb_ccount vortex.tmp
