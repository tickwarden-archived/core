# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/_cut [MACRO]
# INPUT $(a) $(b): win = substring [a, b) of storage macroengine:text s. Bounds must be valid.
$data modify storage macroengine:text win set string storage macroengine:text s $(a) $(b)
