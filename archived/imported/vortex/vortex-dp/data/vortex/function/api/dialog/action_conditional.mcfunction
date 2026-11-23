# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/action_conditional [MACRO]
$data modify storage vortex:dialog_conditional args set value {predicate:"$(predicate)",yes:$(yes),no:$(no),payload:$(payload)}
execute store result score #condition vortex.dialog_tmp run function vortex:core/internal/dialog/condition_test with storage vortex:dialog_conditional args
data modify storage vortex:dialog_conditional args.callback set from storage vortex:dialog_conditional args.no
execute if score #condition vortex.dialog_tmp matches 1 run data modify storage vortex:dialog_conditional args.callback set from storage vortex:dialog_conditional args.yes
return run function vortex:core/internal/dialog/callback with storage vortex:dialog_conditional args
