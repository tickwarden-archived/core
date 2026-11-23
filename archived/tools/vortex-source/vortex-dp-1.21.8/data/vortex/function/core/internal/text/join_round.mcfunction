# vortex:core/internal/text/join_round [INTERNAL] one reduction round, repeats until one entry is left
data modify storage vortex:text nl set value []
function vortex:core/internal/text/join_take
data modify storage vortex:text pc set from storage vortex:text nl
execute if data storage vortex:text pc[1] run function vortex:core/internal/text/join_round
