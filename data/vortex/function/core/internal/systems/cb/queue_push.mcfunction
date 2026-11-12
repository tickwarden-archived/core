# vortex:systems/cb/internal/queue_push
# Reads vortex:input cb {cmd, delay, x, y, z}; no macro, so nothing from the
# caller is pasted into SNBT (a cmd containing a quote can no longer break out of
# the entry or inject keys).
# Appends {cmd, x, y, z, ticks_left, id} to vortex:engine cb_queue and writes
# the entry id to vortex:output cb_id (use it with api/cb/cancel_id).

data modify storage vortex:engine _cb_new set from storage vortex:input cb
execute store result storage vortex:engine _cb_new.ticks_left int 1 run data get storage vortex:input cb.delay
data remove storage vortex:engine _cb_new.delay
scoreboard players add #cb_next_id vortex.tmp 1
execute store result storage vortex:engine _cb_new.id int 1 run scoreboard players get #cb_next_id vortex.tmp
execute store result storage vortex:output cb_id int 1 run scoreboard players get #cb_next_id vortex.tmp
data modify storage vortex:engine cb_queue append from storage vortex:engine _cb_new
data remove storage vortex:engine _cb_new
