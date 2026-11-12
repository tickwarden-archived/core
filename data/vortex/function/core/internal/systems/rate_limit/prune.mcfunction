# vortex:systems/rate_limit/internal/prune — Remove hits outside the sliding window [MACRO]
# Input: $(rule_key), vortex:rate_limit.prune_before (int, from evaluate)
#
# Strategy: iterate hits array from index 0 upward.
# Hits are appended in chronological order, so hits[0] is always the oldest.
# We remove from the front until hits[0].t >= prune_before (or array empty).
# This is O(expired_count) — optimal for a FIFO sliding window.

$execute unless data storage vortex:engine rate_limit.rules.$(rule_key).hits[0] run return 0

# Read oldest hit timestamp
$execute store result score $rl_oldest vortex.tmp run data get storage vortex:engine rate_limit.rules.$(rule_key).hits[0].t

# If oldest hit is still inside window → nothing left to prune
execute if score $rl_oldest vortex.tmp >= $rl_start vortex.tmp run return 0

# Oldest hit is expired → remove it and recurse
$data remove storage vortex:engine rate_limit.rules.$(rule_key).hits[0]
function vortex:core/internal/systems/rate_limit/prune with storage vortex:rate_limit
