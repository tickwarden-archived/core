# vortex:core/internal/core/lib/for_each/list [MACRO]
$data modify storage vortex:engine _felist_state set value {func:"$(func)"}
scoreboard players set $felist_i vortex.tmp 0
function vortex:core/internal/core/lib/for_each/list_step

data remove storage vortex:engine _felist_input
data remove storage vortex:engine _felist_state
data remove storage vortex:engine _felist_current
