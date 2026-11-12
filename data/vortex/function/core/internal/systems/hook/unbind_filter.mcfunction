# vortex:systems/hook/internal/unbind_filter
# Iterates over the _hook_unbinds list.
# Copies back binds that do not match _hook_filter_event to hook_binds.

execute unless data storage vortex:engine _hook_unbinds[0] run return 0

data modify storage vortex:engine _hook_unbinds[0] set from storage vortex:engine _hook_unbinds[0]

function vortex:core/internal/systems/hook/unbind_check with storage vortex:engine _hook_unbinds[0]

data remove storage vortex:engine _hook_unbinds[0]

function vortex:core/internal/systems/hook/unbind_filter
