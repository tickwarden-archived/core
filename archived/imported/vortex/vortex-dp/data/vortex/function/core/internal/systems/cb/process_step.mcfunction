# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/cb/process_step
# Pops first entry from _cb_work.
# ticks_left == 1 → fire now.
# ticks_left > 1  → decrement and return to cb_queue.

# Pop first entry
data modify storage vortex:engine _cb_entry set from storage vortex:engine _cb_work[0]
data remove storage vortex:engine _cb_work[0]

# Decrement ticks_left
execute store result score #cb_tl vortex.tmp run data get storage vortex:engine _cb_entry.ticks_left
scoreboard players remove #cb_tl vortex.tmp 1

# All entries share one temporary command block per location, and a second setblock in
# the same window would overwrite the first before it ran. So after one fires, anything
# else that is ready is pushed back by 1 tick (cooldown #cb_cd, 2 ticks between fires).
execute if score #cb_tl vortex.tmp matches ..0 if score #cb_cd vortex.tmp matches 1.. run scoreboard players set #cb_tl vortex.tmp 1
execute if score #cb_tl vortex.tmp matches ..0 run scoreboard players set #cb_cd vortex.tmp 2
execute if score #cb_tl vortex.tmp matches ..0 run function vortex:core/internal/systems/cb/fire_entry

execute unless score #cb_tl vortex.tmp matches ..0 run execute store result storage vortex:engine _cb_entry.ticks_left int 1 run scoreboard players get #cb_tl vortex.tmp
execute unless score #cb_tl vortex.tmp matches ..0 run data modify storage vortex:engine cb_queue append from storage vortex:engine _cb_entry

data remove storage vortex:engine _cb_entry

# Recurse if more entries remain
execute if data storage vortex:engine _cb_work[0] run function vortex:core/internal/systems/cb/process_step
