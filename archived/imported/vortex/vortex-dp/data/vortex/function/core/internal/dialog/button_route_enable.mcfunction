# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/button_route_enable [MACRO]
$data modify storage vortex:dialog_work routes[{action_index:$(index)}].enabled set value $(enabled)
$execute if data storage vortex:dialog_work form{action_index:$(index)} run data modify storage vortex:dialog_work form.enabled set value $(enabled)
return 1
