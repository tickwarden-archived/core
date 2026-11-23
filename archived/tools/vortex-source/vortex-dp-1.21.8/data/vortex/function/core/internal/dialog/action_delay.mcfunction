# vortex:core/internal/dialog/action_delay
data modify storage vortex:dialog_delay args set from storage vortex:dialog_dispatch stack[-1].current
data modify storage vortex:dialog_delay args.payload set from storage vortex:dialog_action payload
return run function vortex:api/dialog/action_delay with storage vortex:dialog_delay args
