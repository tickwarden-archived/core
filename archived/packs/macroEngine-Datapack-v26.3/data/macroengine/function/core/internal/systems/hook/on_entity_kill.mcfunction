# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/on_entity_kill
# @s = player who triggered the event
data modify storage macroengine:engine _hook_fire_tmp set value {event:"entity_kill"}
function macroengine:core/internal/systems/hook/fire with storage macroengine:engine _hook_fire_tmp
data remove storage macroengine:engine _hook_fire_tmp
