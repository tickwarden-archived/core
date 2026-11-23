# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/percent [MACRO]
# Formats a number as a percent string.
#  Input : $(value)
# Output: vortex:output result → "<value>%"
#
# Example: function vortex:systems/string/percent {value:75}  → "75%"
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$data modify storage vortex:output result set value "$(value)%"
