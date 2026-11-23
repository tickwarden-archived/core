# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/int [MACRO]
# Uniform integer in [min, max] inclusive.
#
# INPUT:  $(min), $(max)
# OUTPUT: vortex:output result
#
# Inverted bounds are swapped rather than rejected. The raw state is
# reduced with abs() before the modulus so a negative state cannot
# produce a result outside the requested range.
#
# Usage:  function vortex:systems/rng/int {min:1,max:6}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
$scoreboard players set $rng_min vortex.tmp $(min)
$scoreboard players set $rng_max vortex.tmp $(max)

execute if score $rng_min vortex.tmp > $rng_max vortex.tmp run function vortex:core/internal/systems/rng/_swap_bounds

scoreboard players operation $rng_span vortex.tmp = $rng_max vortex.tmp
scoreboard players operation $rng_span vortex.tmp -= $rng_min vortex.tmp
scoreboard players add $rng_span vortex.tmp 1

function vortex:core/internal/systems/rng/_core

# INT_MIN has no positive counterpart in a 32-bit score, so fold it to
# INT_MAX first; otherwise the negation below leaves it negative.
execute if score $rng_state vortex.tmp matches -2147483648 run scoreboard players set $rng_state vortex.tmp 2147483647
execute if score $rng_state vortex.tmp matches ..-1 run scoreboard players set $rng_neg vortex.tmp -1
execute if score $rng_state vortex.tmp matches ..-1 run scoreboard players operation $rng_state vortex.tmp *= $rng_neg vortex.tmp

scoreboard players operation $rng_state vortex.tmp %= $rng_span vortex.tmp
scoreboard players operation $rng_state vortex.tmp += $rng_min vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $rng_state vortex.tmp
