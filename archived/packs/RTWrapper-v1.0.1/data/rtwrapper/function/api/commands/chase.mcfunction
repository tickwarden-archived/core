# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Direct named-parameter API for /chase.
# Parameter order: action, targets
data modify storage rtwrapper:runtime current.params set from storage rtwrapper:api params
function rtwrapper:core/wrappers/internal/chase
data remove storage rtwrapper:runtime current.params
