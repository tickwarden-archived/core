# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/block/_registered [INTERNAL, MACRO: id]
# RETURN 1 when block_registry has this id.
$execute if data storage macroengine:engine block_registry."$(id)" run return 1
return 0
