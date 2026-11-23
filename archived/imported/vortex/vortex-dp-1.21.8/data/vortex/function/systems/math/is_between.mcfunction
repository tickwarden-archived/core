# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/is_between
# Checks if value is in the inclusive range [min, max].
#  Input : $(value), $(min), $(max)
# Output: vortex:output result → 1b (true) or 0b (false)
#
# Example:
# data modify storage vortex:input value set value 15
# data modify storage vortex:input min set value 10
# data modify storage vortex:input max set value 20
# function vortex:systems/math/is_between with storage vortex:input {}
# vortex:output result = 1b
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $ib_v vortex.tmp $(value)
$scoreboard players set $ib_lo vortex.tmp $(min)
$scoreboard players set $ib_hi vortex.tmp $(max)

data modify storage vortex:output result set value 0b

execute if score $ib_v vortex.tmp >= $ib_lo vortex.tmp run execute if score $ib_v vortex.tmp <= $ib_hi vortex.tmp run data modify storage vortex:output result set value 1b
