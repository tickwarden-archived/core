# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/square [MACRO]
# Squares an integer (value × value).
#  Input : $(value)  — keep |value| ≤ 46340 to avoid 32-bit overflow
# Output: vortex:output result → int
#
# Example: function vortex:systems/math/square {value:12}  → 144
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $sq_v vortex.tmp $(value)
scoreboard players operation $sq_v vortex.tmp *= $sq_v vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $sq_v vortex.tmp
scoreboard players reset $sq_v vortex.tmp
