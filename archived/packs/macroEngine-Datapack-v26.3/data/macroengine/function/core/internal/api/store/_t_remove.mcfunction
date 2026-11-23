# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_t_remove [MACRO] [INTERNAL]
$data remove storage macroengine:store tpl.$(name).$(lang)
return 1
