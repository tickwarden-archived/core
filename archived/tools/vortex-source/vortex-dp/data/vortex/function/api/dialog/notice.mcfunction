# vortex:api/dialog/notice
# Convert first routed/raw button into notice footer; call before api/show.
execute unless data storage vortex:dialog_work dialog.actions[0] run return 0
data modify storage vortex:dialog_work dialog.type set value "minecraft:notice"
data modify storage vortex:dialog_work dialog.action set from storage vortex:dialog_work dialog.actions[0]
data remove storage vortex:dialog_work dialog.actions
data remove storage vortex:dialog_work dialog.columns
data remove storage vortex:dialog_work dialog.exit_action
