# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/wand/register_fn_do [MACRO] [INTERNAL]
# Called by wand/register_fn with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func)
$data modify storage vortex:engine wand_binds append value {tag:"$(tag)", func:"$(func)"}
