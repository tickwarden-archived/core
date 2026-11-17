# vortex:core/internal/dialog/action_conditional
data modify storage vortex:dialog_conditional args set from storage vortex:dialog_dispatch stack[-1].current
data modify storage vortex:dialog_conditional args.payload set from storage vortex:dialog_action payload
return run function vortex:api/dialog/action_conditional with storage vortex:dialog_conditional args
