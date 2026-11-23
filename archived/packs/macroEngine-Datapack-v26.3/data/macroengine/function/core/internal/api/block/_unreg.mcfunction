# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/block/_unreg [INTERNAL, MACRO: id]
$data remove storage macroengine:engine block_registry."$(id)"
return 1
