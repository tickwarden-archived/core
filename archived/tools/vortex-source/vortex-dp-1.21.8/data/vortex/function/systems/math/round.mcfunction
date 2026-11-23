# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/round
# Rounds a value to the nearest multiple of a given step.
# Integer division truncates toward zero; adding half the step before
# dividing gives standard rounding (0.5 rounds away from zero).
#
# INPUT : $(value) → integer to round
#         $(step)  → rounding step (must be > 0)
# OUTPUT: vortex:output result → rounded value
#
# EXAMPLE:
# function vortex:systems/math/round {value:37, step:10}
# → vortex:output result = 40
# function vortex:systems/math/round {value:34, step:10}
# → vortex:output result = 30
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set #rnd_v vortex.tmp $(value)
$scoreboard players set #rnd_s vortex.tmp $(step)

execute if score #rnd_s vortex.tmp matches ..0 run return fail

# add half step for rounding (integer division: step=10 → half=5)
scoreboard players operation #rnd_half vortex.tmp = #rnd_s vortex.tmp
scoreboard players set #rnd_2 vortex.tmp 2
scoreboard players operation #rnd_half vortex.tmp /= #rnd_2 vortex.tmp

execute if score #rnd_v vortex.tmp matches 0.. run scoreboard players operation #rnd_v vortex.tmp += #rnd_half vortex.tmp
execute if score #rnd_v vortex.tmp matches ..-1 run scoreboard players operation #rnd_v vortex.tmp -= #rnd_half vortex.tmp

scoreboard players operation #rnd_v vortex.tmp /= #rnd_s vortex.tmp
scoreboard players operation #rnd_v vortex.tmp *= #rnd_s vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get #rnd_v vortex.tmp
