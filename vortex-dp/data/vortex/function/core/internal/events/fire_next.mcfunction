# vortex:core/internal/events/fire_next
data modify storage vortex:engine _dispatch.func set from storage vortex:engine _event_tmp[0].func
function #vortex:internal/dispatch
data remove storage vortex:engine _event_tmp[0]
execute if data storage vortex:engine _event_tmp[0] run function vortex:core/internal/events/fire_next
