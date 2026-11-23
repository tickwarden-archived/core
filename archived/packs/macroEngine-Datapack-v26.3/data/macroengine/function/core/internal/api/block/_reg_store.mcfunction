# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/block/_reg_store [INTERNAL, MACRO: id]
$data modify storage macroengine:engine block_registry."$(id)" set from storage macroengine:block tmp.reg
return 1
