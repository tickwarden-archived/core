# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/sign_nonzero
# Returns -1 for negative, +1 for zero-or-positive.
# Useful when you need a non-zero multiplier (e.g. direction vectors).
#
# INPUT : $(value) → integer
# OUTPUT: vortex:output result → 1 or -1
#
# EXAMPLE:
# function vortex:systems/math/sign_nonzero {value:-5}
# → vortex:output result = -1
# function vortex:systems/math/sign_nonzero {value:0}
# → vortex:output result = 1
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set #snz_v vortex.tmp $(value)
data modify storage vortex:output result set value 1
execute if score #snz_v vortex.tmp matches ..-1 run data modify storage vortex:output result set value -1
