# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/string/percent [MACRO]
# Formats a number as a percent string.
#  Input : $(value)
# Output: macroengine:output result → "<value>%"
#
# Example: function macroengine:systems/string/percent {value:75}  → "75%"
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{string:0b} run return 0
$data modify storage macroengine:output result set value "$(value)%"
