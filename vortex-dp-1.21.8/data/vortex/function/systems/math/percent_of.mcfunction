# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/percent_of [MACRO]
# Computes percent% of value (integer division, rounds toward zero).
#  Input : $(value), $(percent) — keep |value × percent| ≤ 2147483647
# Output: vortex:output result → int
#
# Example: function vortex:systems/math/percent_of {value:250,percent:20}  → 50
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $po_v vortex.tmp $(value)
$scoreboard players set $po_p vortex.tmp $(percent)
scoreboard players set $po_100 vortex.tmp 100
scoreboard players operation $po_v vortex.tmp *= $po_p vortex.tmp
scoreboard players operation $po_v vortex.tmp /= $po_100 vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $po_v vortex.tmp
scoreboard players reset $po_v vortex.tmp
scoreboard players reset $po_p vortex.tmp
scoreboard players reset $po_100 vortex.tmp
