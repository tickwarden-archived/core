# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/events/register_once [MACRO] [INTERNAL]
# $(event), $(func) validated by events/register_once.
# ======================================================================================

$execute if data storage vortex:engine events.$(event)[{func:"$(func)"}] run return 0
$data modify storage vortex:engine events.$(event) append value {func:"$(func)"}
data modify storage vortex:output result set value 1b
return 1
