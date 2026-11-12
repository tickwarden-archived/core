# vortex:systems/geo/region_watch/internal/unregister_exec [MACRO]
# INPUT: $(id)
# region_watches in list format — always run filter,
# if id not found, list remains unchanged.

execute unless data storage vortex:engine region_watches run return 0

data modify storage vortex:engine _rw_unbind_id set from storage vortex:input id
data modify storage vortex:engine _rw_new set value []
data modify storage vortex:engine _rw_src set from storage vortex:engine region_watches
function vortex:core/internal/systems/geo/region_watch/unregister_filter
data modify storage vortex:engine region_watches set from storage vortex:engine _rw_new
data remove storage vortex:engine _rw_new
data remove storage vortex:engine _rw_src
data remove storage vortex:engine _rw_unbind_id
