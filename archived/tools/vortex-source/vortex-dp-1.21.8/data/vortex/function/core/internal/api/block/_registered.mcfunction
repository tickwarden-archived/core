# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_registered [INTERNAL, MACRO: id]
# RETURN 1 when block_registry has this id.
$execute if data storage vortex:engine block_registry."$(id)" run return 1
return 0
