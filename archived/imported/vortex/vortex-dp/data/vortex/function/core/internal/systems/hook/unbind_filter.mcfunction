# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/unbind_filter
# Iterates over the _hook_unbinds list.
# Copies back binds that do not match _hook_filter_event to hook_binds.

execute unless data storage vortex:engine _hook_unbinds[0] run return 0

data modify storage vortex:engine _hook_unbinds[0] set from storage vortex:engine _hook_unbinds[0]

function vortex:core/internal/systems/hook/unbind_check with storage vortex:engine _hook_unbinds[0]

data remove storage vortex:engine _hook_unbinds[0]

function vortex:core/internal/systems/hook/unbind_filter
