# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/fire [MACRO]
# INPUT: $(event) — event name to fire
# @s = the triggering player
# Copies hook_binds list and dispatches it.

$data modify storage macroengine:engine _hook_fire_event set value "$(event)"
data modify storage macroengine:engine _hook_iter set from storage macroengine:engine hook_binds

execute if data storage macroengine:engine _hook_iter run function macroengine:core/internal/systems/hook/dispatch

data remove storage macroengine:engine _hook_iter
data remove storage macroengine:engine _hook_fire_event
