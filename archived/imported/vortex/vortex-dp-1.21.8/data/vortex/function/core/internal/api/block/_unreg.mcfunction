# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_unreg [INTERNAL, MACRO: id]
$data remove storage vortex:engine block_registry."$(id)"
return 1
