# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/delay_player [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).delayed run return 0
$execute store result score #delay_epoch vortex.dialog_tmp run data get storage vortex:dialog_db players.p$(id).delayed.epoch
execute unless score #delay_epoch vortex.dialog_tmp = #epoch vortex.dialog_sys run return run function vortex:core/internal/dialog/delay_cancel with storage vortex:dialog_ctx
$execute store result score #delay vortex.dialog_tmp run data get storage vortex:dialog_db players.p$(id).delayed.ticks
scoreboard players remove #delay vortex.dialog_tmp 1
$execute store result storage vortex:dialog_db players.p$(id).delayed.ticks int 1 run scoreboard players get #delay vortex.dialog_tmp
execute if score #delay vortex.dialog_tmp matches 1.. run return 0
$data modify storage vortex:dialog_delay ready set from storage vortex:dialog_db players.p$(id).delayed
$data remove storage vortex:dialog_db players.p$(id).delayed
return run function vortex:core/internal/dialog/callback with storage vortex:dialog_delay ready
