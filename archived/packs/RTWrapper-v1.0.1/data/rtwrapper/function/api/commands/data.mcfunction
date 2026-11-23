# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Direct named-parameter API for /data.
# Parameter order: action, target_kind, target, path, operation, source_kind, source, source_path, value
data modify storage rtwrapper:runtime current.params set from storage rtwrapper:api params
function rtwrapper:core/wrappers/internal/data
data remove storage rtwrapper:runtime current.params
