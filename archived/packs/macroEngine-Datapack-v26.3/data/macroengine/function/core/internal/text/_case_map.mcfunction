# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/_case_map [MACRO]
# INPUT $(t) table name, $(c) one character (quote and backslash are excluded by safe).
# Leaves ch untouched when the table has no entry for c.
$data modify storage macroengine:text ch set from storage macroengine:text_map $(t)."$(c)"
