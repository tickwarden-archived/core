# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/rng/_swap_bounds
# min > max is a caller mistake, not an error: swap and carry on, so
# {min:10,max:1} behaves like {min:1,max:10} instead of producing
# nothing at all.

scoreboard players operation $rng_swap vortex.tmp = $rng_min vortex.tmp
scoreboard players operation $rng_min vortex.tmp = $rng_max vortex.tmp
scoreboard players operation $rng_max vortex.tmp = $rng_swap vortex.tmp
