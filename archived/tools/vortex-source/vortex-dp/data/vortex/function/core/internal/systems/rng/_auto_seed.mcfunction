# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/systems/rng/_auto_seed
# First-use seeding. Called only when rng.state does not exist yet, so
# an explicitly seeded run is never overwritten.
#
# gametime is a weak seed: two servers started at the same tick produce
# the same stream. Call systems/rng/seed when reproducibility matters.
# ─────────────────────────────────────────────────────────────────

execute store result score $rng_seed_tmp vortex.tmp run time query gametime
scoreboard players add $rng_seed_tmp vortex.tmp 57005
execute store result storage vortex:engine rng.state int 1 run scoreboard players get $rng_seed_tmp vortex.tmp
scoreboard players reset $rng_seed_tmp vortex.tmp
