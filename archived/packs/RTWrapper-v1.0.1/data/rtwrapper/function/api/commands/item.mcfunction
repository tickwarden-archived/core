# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Direct named-parameter API for /item.
# Parameter order: action, target_kind, target, slot, modifier, source_kind, source, source_slot, item, count
data modify storage rtwrapper:runtime current.params set from storage rtwrapper:api params
function rtwrapper:core/wrappers/internal/item
data remove storage rtwrapper:runtime current.params
