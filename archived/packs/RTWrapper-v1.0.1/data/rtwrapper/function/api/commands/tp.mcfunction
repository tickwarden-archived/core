# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Direct named-parameter API for /tp.
# Parameter order: target, x, y, z, rotation, facing_mode, facing_target, facing_anchor
data modify storage rtwrapper:runtime current.params set from storage rtwrapper:api params
function rtwrapper:core/wrappers/internal/tp
data remove storage rtwrapper:runtime current.params
