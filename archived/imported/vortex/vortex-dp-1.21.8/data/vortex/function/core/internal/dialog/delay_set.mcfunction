# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/delay_set [MACRO]
$execute if data storage vortex:dialog_db players.p$(id).delayed run return 0
$data modify storage vortex:dialog_db players.p$(id).delayed set value {ticks:$(ticks),callback:$(callback),payload:$(payload)}
$execute store result storage vortex:dialog_db players.p$(id).delayed.epoch int 1 run scoreboard players get #epoch vortex.dialog_sys
return 1
