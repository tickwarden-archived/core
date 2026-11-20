# vortex:core/internal/api/perm/trigger/unbind_filter
execute unless data storage vortex:engine _pt_unbind[0] run return 0

execute store result score $pt_fval vortex.tmp run data get storage vortex:engine _pt_unbind[0].value
execute store result score $pt_uval vortex.tmp run data get storage vortex:engine _pt_uval

execute unless score $pt_fval vortex.tmp = $pt_uval vortex.tmp run function vortex:core/internal/api/perm/trigger/unbind_reinsert with storage vortex:engine _pt_filter_ctx

data remove storage vortex:engine _pt_unbind[0]
function vortex:core/internal/api/perm/trigger/unbind_filter
