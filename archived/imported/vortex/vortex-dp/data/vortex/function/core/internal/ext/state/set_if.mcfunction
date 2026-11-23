# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/state/set_if [MACRO] [INTERNAL]
# $(player), $(from), $(to) validated by core/state/set_if.
# ======================================================================================

$execute unless data storage vortex:engine {states:{$(player):"$(from)"}} run return 0
$data modify storage vortex:engine states.$(player) set value "$(to)"
data modify storage vortex:output result set value 1b
return 1
