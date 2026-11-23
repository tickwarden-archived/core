# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/geo/region_watch/unregister_filter
# Iterates _rw_src list.
# Copies entries whose id does not match _rw_unbind_id to _rw_new.

execute unless data storage vortex:engine _rw_src[0] run return 0

data modify storage vortex:engine _rw_cur set from storage vortex:engine _rw_src[0]
data remove storage vortex:engine _rw_src[0]

function vortex:core/internal/systems/geo/region_watch/unregister_check with storage vortex:engine _rw_cur

function vortex:core/internal/systems/geo/region_watch/unregister_filter
