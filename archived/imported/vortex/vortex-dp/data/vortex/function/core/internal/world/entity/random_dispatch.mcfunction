# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:world/entity/internal/random_dispatch  [INTERNAL — MACRO]
# Called with "with storage vortex:engine _rnd".
#
# Rolls /random value 0..$(max) to pick a uniform random index,
# then runs the target function as the entity whose vortex.rnd_idx
# matches the rolled value.
#
# MACRO ARGS (from vortex:engine _rnd compound):
#   $(max)  → count - 1  (upper bound for random value, inclusive)
#   $(func) → function to dispatch
#   $(type) → entity type filter (same as outer call)
#   $(tag)  → entity tag filter  (same as outer call)
# ─────────────────────────────────────────────────────────────────

# Roll a random integer in [0, max] using the 1.20.2+ /random command
$execute store result score $rnd_pick vortex.tmp run random value 0..$(max)

# Dispatch: run func as the entity whose index was rolled
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @e[type=$(type),tag=$(tag)] if score @s vortex.rnd_idx = $rnd_pick vortex.tmp at @s run function #vortex:internal/dispatch
