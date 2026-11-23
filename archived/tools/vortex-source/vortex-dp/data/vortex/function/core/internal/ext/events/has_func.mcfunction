# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/events/has_func [MACRO] [INTERNAL]
# $(event), $(func) validated by events/has_func.
# ======================================================================================

$execute unless data storage vortex:engine events.$(event)[{func:"$(func)"}] run return 0
data modify storage vortex:output result set value 1b
return 1
