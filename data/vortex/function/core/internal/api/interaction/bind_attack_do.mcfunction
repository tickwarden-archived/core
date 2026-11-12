# vortex:api/interaction/internal/bind_attack_do [MACRO] [INTERNAL]
# Called by bind_attack with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func)
$data modify storage vortex:engine interaction_binds.attack append value {tag:"$(tag)", func:"$(func)"}
