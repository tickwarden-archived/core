# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/cb/seq_push_entry
# Pushes current sequence step as a cb_queue entry.
# Reads: _cb_seq_cmd (string), _cb_delay (score), _cb_seq.{x,y,z}

# Build entry storage
data modify storage vortex:engine _cb_seq_entry set from storage vortex:engine _cb_seq
data remove storage vortex:engine _cb_seq_entry.cmds
data remove storage vortex:engine _cb_seq_entry.interval
data modify storage vortex:engine _cb_seq_entry.cmd set from storage vortex:engine _cb_seq_cmd
execute store result storage vortex:engine _cb_seq_entry.ticks_left int 1 run scoreboard players get #cb_delay vortex.tmp

execute store result storage vortex:engine _cb_seq_entry.id int 1 run scoreboard players get #cb_next_id vortex.tmp
data modify storage vortex:engine cb_queue append from storage vortex:engine _cb_seq_entry
data remove storage vortex:engine _cb_seq_entry
data remove storage vortex:engine _cb_seq_cmd
