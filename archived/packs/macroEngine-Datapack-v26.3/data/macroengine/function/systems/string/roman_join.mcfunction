# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/string/roman_join [MACRO, internal]
# Joins the four Roman digit groups produced by string/roman.
#  Input : $(t), $(h), $(te), $(o)
# Output: macroengine:output result
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{string:0b} run return 0
$data modify storage macroengine:output result set value "$(t)$(h)$(te)$(o)"
