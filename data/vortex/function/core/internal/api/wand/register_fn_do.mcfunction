# vortex:api/wand/internal/register_fn_do [MACRO] [INTERNAL]
# Called by wand/register_fn with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func)
$data modify storage vortex:engine wand_binds append value {tag:"$(tag)", func:"$(func)"}
