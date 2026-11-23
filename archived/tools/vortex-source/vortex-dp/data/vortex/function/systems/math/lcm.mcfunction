# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/lcm
# EKOK (LCM) hesaplar: lcm(a,b) = |a*b| / gcd(a,b)
#  Input : $(a), $(b)          → integers
# Output: vortex:output result → LCM(a, b)
# NOTE : Overflow risk — result may exceed INT_MAX for large inputs.
#
# Example:
# data modify storage vortex:input a set value 12
# data modify storage vortex:input b set value 8
# function vortex:systems/math/lcm with storage vortex:input {}
# vortex:output result = 24
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $lcm_a vortex.tmp $(a)
$scoreboard players set $lcm_b vortex.tmp $(b)

# Zero check
execute if score $lcm_a vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $lcm_a vortex.tmp matches 0 run return 0
execute if score $lcm_b vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $lcm_b vortex.tmp matches 0 run return 0

# Absolute value
scoreboard players set $lcm_neg vortex.tmp -1
execute if score $lcm_a vortex.tmp matches ..-1 run scoreboard players operation $lcm_a vortex.tmp *= $lcm_neg vortex.tmp
execute if score $lcm_b vortex.tmp matches ..-1 run scoreboard players operation $lcm_b vortex.tmp *= $lcm_neg vortex.tmp

# Compute GCD (lcm_a, lcm_b share gcd_a, gcd_b variables)
scoreboard players operation $gcd_a vortex.tmp = $lcm_a vortex.tmp
scoreboard players operation $gcd_b vortex.tmp = $lcm_b vortex.tmp
function vortex:core/internal/systems/math/gcd_loop

# lcm = (a / gcd) * b (divide first to prevent overflow)
scoreboard players operation $lcm_a vortex.tmp /= $gcd_a vortex.tmp
scoreboard players operation $lcm_a vortex.tmp *= $lcm_b vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $lcm_a vortex.tmp
