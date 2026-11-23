# ─────────────────────────────────────────────────────────────────
# vortex:world/entity/internal/random_assign  [INTERNAL]
# Called via "execute as @e[...] run function ..." — runs as each
# matching entity in sequence.
#
# Copies the current counter ($rnd_i vortex.tmp) into this entity's
# vortex.rnd_idx score, then increments the counter.
# Because each function call runs to completion before the next
# entity is processed, $rnd_i increments correctly.
#
# Result: entity 1 → vortex.rnd_idx=0, entity 2 → 1, entity 3 → 2 …
# ─────────────────────────────────────────────────────────────────

scoreboard players operation @s vortex.rnd_idx = $rnd_i vortex.tmp
scoreboard players add $rnd_i vortex.tmp 1
