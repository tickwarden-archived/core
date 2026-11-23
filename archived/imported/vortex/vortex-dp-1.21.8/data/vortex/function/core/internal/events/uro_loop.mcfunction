# vortex:core/internal/events/uro_loop
function vortex:core/internal/events/uro_check with storage vortex:engine _uro.src[0]
data remove storage vortex:engine _uro.src[0]
execute if data storage vortex:engine _uro.src[0] run function vortex:core/internal/events/uro_loop
