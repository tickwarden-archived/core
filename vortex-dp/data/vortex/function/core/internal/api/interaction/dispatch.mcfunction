# vortex:core/internal/api/interaction/dispatch
data modify storage vortex:engine _ia_cur set from storage vortex:engine _ia_iter[0]
data remove storage vortex:engine _ia_iter[0]

function vortex:core/internal/api/interaction/check_bind with storage vortex:engine _ia_cur

execute if data storage vortex:engine _ia_iter[0] run function vortex:core/internal/api/interaction/dispatch
