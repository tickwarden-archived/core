# vortex:core/internal/api/perm/trigger/check_bind
execute unless data storage vortex:engine _ptd_binds[0] run return 0

data modify storage vortex:engine _ptd_current set from storage vortex:engine _ptd_binds[0]
data remove storage vortex:engine _ptd_binds[0]

execute store result score $ptd_entry_val vortex.tmp run data get storage vortex:engine _ptd_current.value
execute if score $ptd_val vortex.tmp = $ptd_entry_val vortex.tmp run function vortex:core/internal/api/perm/trigger/run_if_perm with storage vortex:engine _ptd_current

function vortex:core/internal/api/perm/trigger/check_bind
