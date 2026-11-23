# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/confirmation
# Convert first two routed buttons into yes/no. Escape invokes no.
execute unless data storage vortex:dialog_work dialog.actions[1] run return 0
data modify storage vortex:dialog_work dialog.type set value "minecraft:confirmation"
data modify storage vortex:dialog_work dialog.yes set from storage vortex:dialog_work dialog.actions[0]
data modify storage vortex:dialog_work dialog.no set from storage vortex:dialog_work dialog.actions[1]
data remove storage vortex:dialog_work dialog.actions
data remove storage vortex:dialog_work dialog.columns
data remove storage vortex:dialog_work dialog.exit_action
