# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/gcd
# Computes GCD using the Euclidean algorithm.
#  Input : $(a), $(b)          → integers (may be negative)
# Output: vortex:output result → GCD(|a|, |b|)
#
# Example:
# data modify storage vortex:input a set value 48
# data modify storage vortex:input b set value 18
# function vortex:systems/math/gcd with storage vortex:input {}
# vortex:output result = 6
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $gcd_a vortex.tmp $(a)
$scoreboard players set $gcd_b vortex.tmp $(b)

# Take absolute value
scoreboard players set $gcd_neg vortex.tmp -1
execute if score $gcd_a vortex.tmp matches ..-1 run scoreboard players operation $gcd_a vortex.tmp *= $gcd_neg vortex.tmp
execute if score $gcd_b vortex.tmp matches ..-1 run scoreboard players operation $gcd_b vortex.tmp *= $gcd_neg vortex.tmp

# b=0 → result is a
execute if score $gcd_b vortex.tmp matches 0 run execute store result storage vortex:output result int 1 run scoreboard players get $gcd_a vortex.tmp
execute if score $gcd_b vortex.tmp matches 0 run return 0

# Euclidean loop (inner function)
function vortex:core/internal/systems/math/gcd_loop

execute store result storage vortex:output result int 1 run scoreboard players get $gcd_a vortex.tmp
