# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/batch/flush_loop
# Consumes _bfl_items. For each item:
# delay = floor($bfl_idx * $bfl_spread / $bfl_total)
# computed and added to the queue.
# func or cmd presence is checked with execute if data.

execute unless data storage vortex:engine _bfl_items[0] run return 0

# delay = floor(idx * spread / total)
scoreboard players operation $bfl_delay vortex.tmp = $bfl_idx vortex.tmp
scoreboard players operation $bfl_delay vortex.tmp *= $bfl_spread vortex.tmp
scoreboard players operation $bfl_delay vortex.tmp /= $bfl_total vortex.tmp

# Move item to temporary storage
data modify storage vortex:engine _bfl_cur set from storage vortex:engine _bfl_items[0]
data remove storage vortex:engine _bfl_items[0]

# Write delay to item, then queue by func/cmd
execute store result storage vortex:engine _bfl_cur.delay int 1 run scoreboard players get $bfl_delay vortex.tmp

execute if data storage vortex:engine _bfl_cur.func run function vortex:core/internal/core/lib/batch/flush_queue_func with storage vortex:engine _bfl_cur
execute unless data storage vortex:engine _bfl_cur.func run execute if data storage vortex:engine _bfl_cur.cmd run function vortex:core/internal/core/lib/batch/flush_queue_cmd with storage vortex:engine _bfl_cur

data remove storage vortex:engine _bfl_cur
scoreboard players add $bfl_idx vortex.tmp 1

function vortex:core/internal/core/lib/batch/flush_loop
