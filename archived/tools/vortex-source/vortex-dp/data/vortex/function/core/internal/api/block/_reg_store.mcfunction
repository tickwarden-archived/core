# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_reg_store [INTERNAL, MACRO: id]
$data modify storage vortex:engine block_registry."$(id)" set from storage vortex:block tmp.reg
return 1
