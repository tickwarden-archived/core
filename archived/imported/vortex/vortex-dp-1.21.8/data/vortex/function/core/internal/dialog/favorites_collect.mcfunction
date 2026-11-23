# vortex:core/internal/dialog/favorites_collect
execute unless data storage vortex:dialog_filter queue[0] run return 1
data modify storage vortex:dialog_filter model.items append from storage vortex:dialog_filter queue[0].item
data remove storage vortex:dialog_filter queue[0]
return run function vortex:core/internal/dialog/favorites_collect
