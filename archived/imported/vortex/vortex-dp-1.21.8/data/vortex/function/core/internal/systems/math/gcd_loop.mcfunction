# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Euclidean step: a = b, b = a % b — repeat until b is zero
execute if score $gcd_b vortex.tmp matches 0 run return 0

scoreboard players operation $gcd_t vortex.tmp = $gcd_a vortex.tmp
scoreboard players operation $gcd_a vortex.tmp = $gcd_b vortex.tmp
scoreboard players operation $gcd_t vortex.tmp %= $gcd_b vortex.tmp
scoreboard players operation $gcd_b vortex.tmp = $gcd_t vortex.tmp

function vortex:core/internal/systems/math/gcd_loop
