# vortex:systems/cb/internal/seq_expand
# Converts cb.cmds list + interval into individual cb_queue entries.
# Each entry gets ticks_left = (index + 1) * interval.

# Init sequence state
data modify storage vortex:engine _cb_seq set from storage vortex:input cb
execute store result score #cb_seq_idx vortex.tmp run data get storage vortex:engine _cb_seq.interval
scoreboard players set #cb_seq_step vortex.tmp 0
# One id for the whole sequence (cancel_id cancels every remaining step)
scoreboard players add #cb_next_id vortex.tmp 1
execute store result storage vortex:output cb_id int 1 run scoreboard players get #cb_next_id vortex.tmp

execute if data storage vortex:engine _cb_seq.cmds[0] run function vortex:core/internal/systems/cb/seq_expand_loop
data remove storage vortex:engine _cb_seq
