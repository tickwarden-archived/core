# vortex:api/dialog/button [MACRO]
$data modify storage vortex:dialog_work route set value {label:$(label),callback:$(callback),payload:$(payload)}
execute store result score #ok vortex.dialog_tmp run function vortex:core/internal/dialog/ticket
execute unless score #ok vortex.dialog_tmp matches 1 run return 0
function vortex:core/internal/dialog/button with storage vortex:dialog_work route
