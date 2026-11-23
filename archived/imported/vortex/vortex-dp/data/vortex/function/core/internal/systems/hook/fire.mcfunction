# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/fire [MACRO]
# INPUT: $(event) — event name to fire
# @s = the triggering player
# Copies hook_binds list and dispatches it.

$data modify storage vortex:engine _hook_fire_event set value "$(event)"
data modify storage vortex:engine _hook_iter set from storage vortex:engine hook_binds

execute if data storage vortex:engine _hook_iter run function vortex:core/internal/systems/hook/dispatch

data remove storage vortex:engine _hook_iter
data remove storage vortex:engine _hook_fire_event
