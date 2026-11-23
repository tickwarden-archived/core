# vortex:core/internal/api/store/_g_get [MACRO] [INTERNAL]
$execute unless data storage vortex:store g.$(name) run return 0
$data modify storage vortex:store out.value set from storage vortex:store g.$(name)
return 1
