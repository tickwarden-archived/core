# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/wand/register_do [MACRO] [INTERNAL]
# Called by wand/register with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func), $(cmd)
$data modify storage vortex:engine wand_binds append value {tag:"$(tag)", func:"$(func)", cmd:"$(cmd)"}
