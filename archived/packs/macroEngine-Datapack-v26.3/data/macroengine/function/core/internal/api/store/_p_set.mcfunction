# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_p_set [MACRO] [INTERNAL]
$data modify storage macroengine:store p."$(a)_$(b)_$(c)_$(d)".$(name) set from storage macroengine:store in.value
return 1
