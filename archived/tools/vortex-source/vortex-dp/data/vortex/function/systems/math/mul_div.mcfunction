# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/mul_div
# Computes floor(a * b / c) without 32-bit integer overflow.
# Uses the identity: floor(a*b/c) = (a/c)*b + (a%c)*b/c
# This avoids overflow when a*b would exceed ±2147483647.
#  Input : $(a), $(b), $(c)   → integers; c must not be 0
# Output: vortex:output result → floor(a * b / c)
#
# Note: if (a % c) * b still overflows (e.g. huge b with c=1),
#       the result is clamped by Java's 32-bit signed wrapping.
#       For those cases, reduce inputs before calling.
#
# Example:
# data modify storage vortex:input a set value 1000000
# data modify storage vortex:input b set value 1000000
# data modify storage vortex:input c set value 500000
# function vortex:systems/math/mul_div with storage vortex:input {}
# vortex:output result = 2000000
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $md_a vortex.tmp $(a)
$scoreboard players set $md_b vortex.tmp $(b)
$scoreboard players set $md_c vortex.tmp $(c)

# Guard: c = 0 → undefined, return 0
execute if score $md_c vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $md_c vortex.tmp matches 0 run return 0

# q = a / c  (integer quotient)
scoreboard players operation $md_q vortex.tmp = $md_a vortex.tmp
scoreboard players operation $md_q vortex.tmp /= $md_c vortex.tmp

# r = a % c  (remainder, Java truncated — may be negative)
scoreboard players operation $md_r vortex.tmp = $md_a vortex.tmp
scoreboard players operation $md_r vortex.tmp %= $md_c vortex.tmp

# result = q * b  +  r * b / c
scoreboard players operation $md_q vortex.tmp *= $md_b vortex.tmp
scoreboard players operation $md_r vortex.tmp *= $md_b vortex.tmp
scoreboard players operation $md_r vortex.tmp /= $md_c vortex.tmp
scoreboard players operation $md_q vortex.tmp += $md_r vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $md_q vortex.tmp
