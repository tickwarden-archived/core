# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/state/set_if [MACRO] [INTERNAL]
# $(player), $(from), $(to) validated by core/state/set_if.
# ======================================================================================

$execute unless data storage macroengine:engine {states:{$(player):"$(from)"}} run return 0
$data modify storage macroengine:engine states.$(player) set value "$(to)"
data modify storage macroengine:output result set value 1b
return 1
