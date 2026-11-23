# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/string/signed_number [MACRO]
# Formats a number with an explicit sign: positives get a leading "+".
#  Input : $(value)
# Output: macroengine:output result → "+5", "0" or "-5"
#
# Example: function macroengine:systems/string/signed_number {value:5}  → "+5"
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{string:0b} run return 0
$scoreboard players set $sn_v macroengine.tmp $(value)
$execute if score $sn_v macroengine.tmp matches 1.. run data modify storage macroengine:output result set value "+$(value)"
$execute if score $sn_v macroengine.tmp matches ..0 run data modify storage macroengine:output result set value "$(value)"
scoreboard players reset $sn_v macroengine.tmp
