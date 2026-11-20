# vortex:api/interaction/unbind_use [MACRO]
execute if data storage vortex:engine modules{interaction:0b} run return 0
execute unless data storage vortex:engine interaction_binds.use[0] run return 0

data modify storage vortex:engine _ia_ubinds set from storage vortex:engine interaction_binds.use
data modify storage vortex:engine interaction_binds.use set value []
$data modify storage vortex:engine _ia_ufilter set value {tag:"$(tag)", func:"$(func)", list:"use"}
function vortex:core/internal/api/interaction/unbind_filter
data remove storage vortex:engine _ia_ubinds
data remove storage vortex:engine _ia_ufilter
