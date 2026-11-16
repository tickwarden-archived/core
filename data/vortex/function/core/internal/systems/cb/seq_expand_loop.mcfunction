# vortex:core/internal/systems/cb/seq_expand_loop
# Pops first cmd from _cb_seq.cmds, computes its delay, pushes to queue.

# Increment step counter and compute cumulative delay
scoreboard players add #cb_seq_step vortex.tmp 1
execute store result score #cb_delay vortex.tmp run scoreboard players get #cb_seq_step vortex.tmp
scoreboard players operation #cb_delay vortex.tmp *= #cb_seq_idx vortex.tmp

# Pop cmd from list into scratch
data modify storage vortex:engine _cb_seq_cmd set from storage vortex:engine _cb_seq.cmds[0]
data remove storage vortex:engine _cb_seq.cmds[0]

# Write queue entry
function vortex:core/internal/systems/cb/seq_push_entry

# Continue if more cmds remain
execute if data storage vortex:engine _cb_seq.cmds[0] run function vortex:core/internal/systems/cb/seq_expand_loop
