# vortex:api/perm/trigger/unbind [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
$execute unless data storage vortex:engine perm_triggers.$(name) run return 0

$data modify storage vortex:engine _pt_unbind set from storage vortex:engine perm_triggers.$(name)
$data modify storage vortex:engine perm_triggers.$(name) set value []
$data modify storage vortex:engine _pt_uval set value $(value)
$data modify storage vortex:engine _pt_filter_ctx set value {name:"$(name)"}

function vortex:core/internal/api/perm/trigger/unbind_filter

data remove storage vortex:engine _pt_unbind
data remove storage vortex:engine _pt_uval
data remove storage vortex:engine _pt_filter_ctx
