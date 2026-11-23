# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/signed_number [MACRO]
# Formats a number with an explicit sign: positives get a leading "+".
#  Input : $(value)
# Output: vortex:output result → "+5", "0" or "-5"
#
# Example: function vortex:systems/string/signed_number {value:5}  → "+5"
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $sn_v vortex.tmp $(value)
$execute if score $sn_v vortex.tmp matches 1.. run data modify storage vortex:output result set value "+$(value)"
$execute if score $sn_v vortex.tmp matches ..0 run data modify storage vortex:output result set value "$(value)"
scoreboard players reset $sn_v vortex.tmp
