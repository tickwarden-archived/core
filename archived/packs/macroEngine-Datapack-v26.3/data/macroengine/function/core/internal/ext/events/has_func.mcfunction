# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/events/has_func [MACRO] [INTERNAL]
# $(event), $(func) validated by events/has_func.
# ======================================================================================

$execute unless data storage macroengine:engine events.$(event)[{func:"$(func)"}] run return 0
data modify storage macroengine:output result set value 1b
return 1
