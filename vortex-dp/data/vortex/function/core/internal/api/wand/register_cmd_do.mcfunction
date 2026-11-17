# vortex:core/internal/api/wand/register_cmd_do [MACRO] [INTERNAL]
# Called by wand/register_cmd with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(cmd)
$data modify storage vortex:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)"}
