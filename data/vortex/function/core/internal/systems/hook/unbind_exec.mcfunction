# vortex:systems/hook/internal/unbind_exec [MACRO]
# INPUT: $(event)
# Filters all binds belonging to $(event) from hook_binds.

data modify storage vortex:engine _hook_unbinds set from storage vortex:engine hook_binds
data modify storage vortex:engine hook_binds set value []
$data modify storage vortex:engine _hook_filter_event set value "$(event)"
function vortex:core/internal/systems/hook/unbind_filter

data remove storage vortex:engine _hook_unbinds
data remove storage vortex:engine _hook_filter_event
