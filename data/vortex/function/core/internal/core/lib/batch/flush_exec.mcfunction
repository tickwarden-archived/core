# vortex:core/lib/batch/internal/flush_exec [MACRO]
# INPUT: $(id)
# For each item, delay = floor(idx * spread_over / total) is computed.
# Item'lar tek tek process_queue'ya eklenir — slice storage gerekmez.

$execute unless data storage vortex:engine batches.$(id) run return 0

# Load total and spread_over values to score
$execute store result score $bfl_total vortex.tmp run data get storage vortex:engine batches.$(id).items
$execute store result score $bfl_spread vortex.tmp run data get storage vortex:engine batches.$(id).spread_over
execute if score $bfl_spread vortex.tmp matches ..0 run scoreboard players set $bfl_spread vortex.tmp 1
execute if score $bfl_total vortex.tmp matches 0 run return 0

# Iteration counter
scoreboard players set $bfl_idx vortex.tmp 0

# Copy items to working storage
$data modify storage vortex:engine _bfl_items set from storage vortex:engine batches.$(id).items

function vortex:core/internal/core/lib/batch/flush_loop

data remove storage vortex:engine _bfl_items
scoreboard players reset $bfl_idx vortex.tmp
scoreboard players reset $bfl_total vortex.tmp
scoreboard players reset $bfl_spread vortex.tmp

$data remove storage vortex:engine batches.$(id)
