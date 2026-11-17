# vortex:core/internal/api/interaction/bind_use_do [MACRO] [INTERNAL]
# Called by bind_use with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func)
$data modify storage vortex:engine interaction_binds.use append value {tag:"$(tag)", func:"$(func)"}
