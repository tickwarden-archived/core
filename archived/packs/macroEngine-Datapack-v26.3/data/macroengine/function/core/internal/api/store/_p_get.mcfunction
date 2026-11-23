# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_p_get [MACRO] [INTERNAL]
$execute unless data storage macroengine:store p."$(a)_$(b)_$(c)_$(d)".$(name) run return 0
$data modify storage macroengine:store out.value set from storage macroengine:store p."$(a)_$(b)_$(c)_$(d)".$(name)
return 1
