# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/favorites_collect
execute unless data storage vortex:dialog_filter queue[0] run return 1
data modify storage vortex:dialog_filter model.items append from storage vortex:dialog_filter queue[0].item
data remove storage vortex:dialog_filter queue[0]
return run function vortex:core/internal/dialog/favorites_collect
