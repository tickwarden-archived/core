# vortex:api/wand/internal/register_do [MACRO] [INTERNAL]
# Called by wand/register with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func), $(cmd)
$data modify storage vortex:engine wand_binds append value {tag:"$(tag)", func:"$(func)", cmd:"$(cmd)"}
