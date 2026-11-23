# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/interaction/internal/bind_use_do [MACRO] [INTERNAL]
# Called by bind_use with storage macroengine:input {} to do the actual append.
# INPUT: $(tag), $(func)
$data modify storage macroengine:engine interaction_binds.use append value {tag:"$(tag)", func:"$(func)"}
