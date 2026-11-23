# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/seed [MACRO]
# Sets the generator state explicitly. Two runs started from the same
# seed produce the same sequence, which is what makes randomised
# behaviour testable.
#
# INPUT: $(seed) — any integer
#
# Usage:  function vortex:systems/rng/seed {seed:12345}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
$scoreboard players set $rng_seed vortex.tmp $(seed)
execute store result storage vortex:engine rng.state int 1 run scoreboard players get $rng_seed vortex.tmp
scoreboard players reset $rng_seed vortex.tmp
