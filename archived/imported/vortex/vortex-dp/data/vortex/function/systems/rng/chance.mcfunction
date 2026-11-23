# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/chance [MACRO]
# Writes 1 to vortex:output result with probability percent/100,
# otherwise 0.
#
# INPUT: $(percent) — clamped, so 0 always yields 0 and 100+ always 1
#
# Usage:  function vortex:systems/rng/chance {percent:25}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
$scoreboard players set $rng_pct vortex.tmp $(percent)

execute if score $rng_pct vortex.tmp matches ..0 run data modify storage vortex:output result set value 0
execute if score $rng_pct vortex.tmp matches ..0 run return 0
execute if score $rng_pct vortex.tmp matches 100.. run data modify storage vortex:output result set value 1
execute if score $rng_pct vortex.tmp matches 100.. run return 0

function vortex:systems/rng/int {min:0,max:99}
execute store result score $rng_roll vortex.tmp run data get storage vortex:output result

execute if score $rng_roll vortex.tmp < $rng_pct vortex.tmp run data modify storage vortex:output result set value 1
execute unless score $rng_roll vortex.tmp < $rng_pct vortex.tmp run data modify storage vortex:output result set value 0

scoreboard players reset $rng_pct vortex.tmp
scoreboard players reset $rng_roll vortex.tmp
