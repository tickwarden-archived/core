# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/next
# Advances the generator and writes the raw new state to
# vortex:output result. Unbounded — use systems/rng/int when a
# value inside a range is wanted.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
function vortex:core/internal/systems/rng/_core
execute store result storage vortex:output result int 1 run scoreboard players get $rng_state vortex.tmp
