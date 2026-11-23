# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_p_has [MACRO] [INTERNAL]
$return run execute if data storage macroengine:store p."$(a)_$(b)_$(c)_$(d)".$(name)
