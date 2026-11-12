# vortex:systems/geo/region_watch/internal/region_loop
# @s = the player being checked
# Consumes _rw_iter list, calls check_region for each region.

execute unless data storage vortex:engine _rw_iter[0] run return 0

data modify storage vortex:engine _rw_cur set from storage vortex:engine _rw_iter[0]
data remove storage vortex:engine _rw_iter[0]

function vortex:core/internal/systems/geo/region_watch/check_region with storage vortex:engine _rw_cur

function vortex:core/internal/systems/geo/region_watch/region_loop
