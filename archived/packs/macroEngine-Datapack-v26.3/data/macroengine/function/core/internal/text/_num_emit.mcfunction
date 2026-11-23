# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/_num_emit [MACRO]
# INPUT $(s): a string already validated by num_check (digits, one '-', one '.').
$data modify storage macroengine:text out set value $(s)
