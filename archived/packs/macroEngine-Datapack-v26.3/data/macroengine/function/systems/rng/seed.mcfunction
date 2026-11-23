# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/rng/seed [MACRO]
# Sets the generator state explicitly. Two runs started from the same
# seed produce the same sequence, which is what makes randomised
# behaviour testable.
#
# INPUT: $(seed) — any integer
#
# Usage:  function macroengine:systems/rng/seed {seed:12345}
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{rng:0b} run return 0
$scoreboard players set $rng_seed macroengine.tmp $(seed)
execute store result storage macroengine:engine rng.state int 1 run scoreboard players get $rng_seed macroengine.tmp
scoreboard players reset $rng_seed macroengine.tmp
