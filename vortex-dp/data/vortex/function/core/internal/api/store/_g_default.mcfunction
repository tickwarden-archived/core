# vortex:core/internal/api/store/_g_default [MACRO] [INTERNAL]
$execute if data storage vortex:store g.$(name) run return 0
$data modify storage vortex:store g.$(name) set from storage vortex:store in.value
return 1
