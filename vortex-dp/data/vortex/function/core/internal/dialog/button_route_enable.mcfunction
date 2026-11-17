# vortex:core/internal/dialog/button_route_enable [MACRO]
$data modify storage vortex:dialog_work routes[{action_index:$(index)}].enabled set value $(enabled)
$execute if data storage vortex:dialog_work form{action_index:$(index)} run data modify storage vortex:dialog_work form.enabled set value $(enabled)
return 1
