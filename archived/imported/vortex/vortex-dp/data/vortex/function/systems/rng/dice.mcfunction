# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/dice [MACRO]
# Rolls one die with N sides (1..sides), using the seeded generator.
#  Input : $(sides) — values below 1 are treated as 1
# Output: vortex:output result → int in 1..sides
#
# Example: function vortex:systems/rng/dice {sides:6}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
$scoreboard players set $dice_s vortex.tmp $(sides)
execute if score $dice_s vortex.tmp matches ..1 run data modify storage vortex:output result set value 1
execute if score $dice_s vortex.tmp matches ..1 run return 0
$function vortex:systems/rng/int {min:1,max:$(sides)}
scoreboard players reset $dice_s vortex.tmp
