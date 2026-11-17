# vortex:api/dialog/action_delay [MACRO]
$data modify storage vortex:dialog_delay args set value {ticks:$(ticks),callback:$(callback),payload:$(payload)}
execute store result score #delay vortex.dialog_tmp run data get storage vortex:dialog_delay args.ticks
execute unless score #delay vortex.dialog_tmp matches 1..1200 run return 0
execute store result storage vortex:dialog_delay check int 1 run scoreboard players get #delay vortex.dialog_tmp
execute store result score #delay_type vortex.dialog_tmp run data modify storage vortex:dialog_delay check set from storage vortex:dialog_delay args.ticks
execute if score #delay_type vortex.dialog_tmp matches 1 run return 0
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_delay args.id set from storage vortex:dialog_ctx id
return run function vortex:core/internal/dialog/delay_set with storage vortex:dialog_delay args
