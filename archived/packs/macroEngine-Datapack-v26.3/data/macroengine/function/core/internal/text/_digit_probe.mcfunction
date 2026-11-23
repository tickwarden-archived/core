# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/_digit_probe [MACRO]
$execute if data storage macroengine:text_map digit."$(c)" run data modify storage macroengine:text isd set value 1b
