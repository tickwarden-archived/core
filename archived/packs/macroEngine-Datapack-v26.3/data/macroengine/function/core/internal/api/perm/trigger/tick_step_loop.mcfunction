# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/perm/trigger/tick_step_loop
execute unless data storage macroengine:engine _pt_names_tmp[0] run return 0

data modify storage macroengine:engine _pt_tick_ctx set from storage macroengine:engine _pt_names_tmp[0]
data remove storage macroengine:engine _pt_names_tmp[0]

function macroengine:core/internal/api/perm/trigger/tick_dispatch with storage macroengine:engine _pt_tick_ctx

function macroengine:core/internal/api/perm/trigger/tick_step_loop
