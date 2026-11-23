# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_lang [INTERNAL]
# Validates macroengine:store in.lang and copies it to tmp.k.lang. RETURN 1 valid, 0 invalid.
data remove storage macroengine:validate in
data modify storage macroengine:validate in.value set from storage macroengine:store in.lang
execute unless function macroengine:systems/validate/safe_name run return 0
data modify storage macroengine:store tmp.k.lang set from storage macroengine:store in.lang
return 1
