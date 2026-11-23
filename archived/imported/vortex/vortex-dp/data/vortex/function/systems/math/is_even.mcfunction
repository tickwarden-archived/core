# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/is_even [MACRO]
# Checks whether an integer is even.
#  Input : $(value)
# Output: vortex:output result → 1b (even) or 0b (odd)
#
# Example: function vortex:systems/math/is_even {value:42}  → 1b
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $ie_v vortex.tmp $(value)
scoreboard players set $ie_2 vortex.tmp 2
scoreboard players operation $ie_v vortex.tmp %= $ie_2 vortex.tmp
data modify storage vortex:output result set value 0b
execute if score $ie_v vortex.tmp matches 0 run data modify storage vortex:output result set value 1b
scoreboard players reset $ie_v vortex.tmp
scoreboard players reset $ie_2 vortex.tmp
