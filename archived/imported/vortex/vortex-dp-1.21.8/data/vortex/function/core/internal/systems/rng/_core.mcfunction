# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/systems/rng/_core
# Advances the generator by one step and leaves the new raw state in
# $rng_state vortex.tmp. Bounded output is the caller's job.
#
# Linear congruential generator, state = state * 1664525 + 1013904223
# (mod 2^32, which is what scoreboard overflow gives for free). The
# constants are the Numerical Recipes ones; the full 32-bit state is
# kept, and callers discard the low bits they do not trust by taking a
# modulus over the range they actually need.
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine rng.state run function vortex:core/internal/systems/rng/_auto_seed

execute store result score $rng_state vortex.tmp run data get storage vortex:engine rng.state

scoreboard players set $rng_lcg_a vortex.tmp 1664525
scoreboard players set $rng_lcg_c vortex.tmp 1013904223
scoreboard players operation $rng_state vortex.tmp *= $rng_lcg_a vortex.tmp
scoreboard players operation $rng_state vortex.tmp += $rng_lcg_c vortex.tmp

execute store result storage vortex:engine rng.state int 1 run scoreboard players get $rng_state vortex.tmp
