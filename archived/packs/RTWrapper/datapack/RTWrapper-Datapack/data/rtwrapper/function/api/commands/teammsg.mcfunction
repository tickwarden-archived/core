# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# Direct named-parameter API for /teammsg.
# Parameter order: message
data modify storage rtwrapper:runtime current.params set from storage rtwrapper:api params
function rtwrapper:core/wrappers/internal/teammsg
data remove storage rtwrapper:runtime current.params
