# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/dispatch
# Iterates _hook_iter list, runs matching events.

execute unless data storage vortex:engine _hook_iter[0] run return 0

data modify storage vortex:engine _hook_ctx set from storage vortex:engine _hook_iter[0]
data remove storage vortex:engine _hook_iter[0]

function vortex:core/internal/systems/hook/check_bind with storage vortex:engine _hook_ctx

function vortex:core/internal/systems/hook/dispatch
