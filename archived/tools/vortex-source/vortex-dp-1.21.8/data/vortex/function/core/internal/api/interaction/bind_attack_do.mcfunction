# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/interaction/bind_attack_do [MACRO] [INTERNAL]
# Called by bind_attack with storage vortex:input {} to do the actual append.
# INPUT: $(tag), $(func)
$data modify storage vortex:engine interaction_binds.attack append value {tag:"$(tag)", func:"$(func)"}
