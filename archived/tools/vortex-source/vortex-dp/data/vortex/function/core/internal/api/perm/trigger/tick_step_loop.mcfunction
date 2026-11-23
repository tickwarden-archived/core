# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/trigger/tick_step_loop
execute unless data storage vortex:engine _pt_names_tmp[0] run return 0

data modify storage vortex:engine _pt_tick_ctx set from storage vortex:engine _pt_names_tmp[0]
data remove storage vortex:engine _pt_names_tmp[0]

function vortex:core/internal/api/perm/trigger/tick_dispatch with storage vortex:engine _pt_tick_ctx

function vortex:core/internal/api/perm/trigger/tick_step_loop
