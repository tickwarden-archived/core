# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/rate_limit/evaluate — Sliding window core [MACRO]
# Input: $(key), $(limit), $(window), $(hits) (array, not used directly here)
#
# Algorithm:
# 1. Get current epoch tick
# 2. Compute window start = epoch - window + 1
# 3. Prune hits older than window start → stored as vortex:engine rate_limit.rules.<key>.hits
# 4. Count remaining hits
# 5. If count < limit → record new hit, return ALLOWED
# 6. Else → return DENIED (do NOT record hit)

# Step 1: capture current epoch + compute window boundary
execute store result score $rl_now vortex.tmp run scoreboard players get $epoch vortex.time
$scoreboard players set $rl_win vortex.tmp $(window)
scoreboard players operation $rl_start vortex.tmp = $rl_now vortex.tmp
scoreboard players operation $rl_start vortex.tmp -= $rl_win vortex.tmp
scoreboard players add $rl_start vortex.tmp 1

# Step 2: write boundary into work storage for the pruner macro
execute store result storage vortex:rate_limit prune_before int 1 run scoreboard players get $rl_start vortex.tmp

# Step 3: prune expired hits (hits[i].t < prune_before)
# We do this by rebuilding the hits list via internal/prune
$data modify storage vortex:rate_limit rule_key set value "$(key)"
function vortex:core/internal/systems/rate_limit/prune with storage vortex:rate_limit

# Step 4: count surviving hits
$execute store result score $rl_count vortex.tmp run data get storage vortex:engine rate_limit.rules.$(key).hits

# Step 5: compare against limit
$scoreboard players set $rl_limit vortex.tmp $(limit)

# DENIED path — limit reached
execute if score $rl_count vortex.tmp >= $rl_limit vortex.tmp run data modify storage vortex:output result set value 0b
execute if score $rl_count vortex.tmp >= $rl_limit vortex.tmp run return 0

# ALLOWED path — append new hit timestamp
execute store result storage vortex:rate_limit new_hit.t int 1 run scoreboard players get $rl_now vortex.tmp
$data modify storage vortex:engine rate_limit.rules.$(key).hits append from storage vortex:rate_limit new_hit
