# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/action_conditional
data modify storage vortex:dialog_conditional args set from storage vortex:dialog_dispatch stack[-1].current
data modify storage vortex:dialog_conditional args.payload set from storage vortex:dialog_action payload
return run function vortex:api/dialog/action_conditional with storage vortex:dialog_conditional args
