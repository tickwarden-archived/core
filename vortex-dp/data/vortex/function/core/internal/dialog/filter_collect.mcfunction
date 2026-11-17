# vortex:core/internal/dialog/filter_collect
execute unless data storage vortex:dialog_filter queue[0] run return 1
data modify storage vortex:dialog_filter item set from storage vortex:dialog_filter queue[0]
function vortex:core/internal/dialog/filter_match with storage vortex:dialog_filter options
data remove storage vortex:dialog_filter queue[0]
return run function vortex:core/internal/dialog/filter_collect
