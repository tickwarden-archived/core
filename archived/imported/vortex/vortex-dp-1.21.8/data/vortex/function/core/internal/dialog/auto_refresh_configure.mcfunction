# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/auto_refresh_configure
function vortex:api/dialog/auto_refresh_stop
execute unless data storage vortex:dialog_work view.callback run return 0
execute if data storage vortex:dialog_work dialog.inputs[0] run return 0
execute unless data storage vortex:dialog_work refresh.interval run return 0
execute store result score #refresh_ticks vortex.dialog_tmp run data get storage vortex:dialog_work refresh.interval
execute unless score #refresh_ticks vortex.dialog_tmp matches 5..1200 run return 0
scoreboard players operation @s vortex.dialog_interval = #refresh_ticks vortex.dialog_tmp
scoreboard players operation @s vortex.dialog_refresh = #refresh_ticks vortex.dialog_tmp
