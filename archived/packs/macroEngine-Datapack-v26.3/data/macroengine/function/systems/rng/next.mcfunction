# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/rng/next
# Advances the generator and writes the raw new state to
# macroengine:output result. Unbounded — use systems/rng/int when a
# value inside a range is wanted.
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{rng:0b} run return 0
function macroengine:core/internal/systems/rng/_core
execute store result storage macroengine:output result int 1 run scoreboard players get $rng_state macroengine.tmp
