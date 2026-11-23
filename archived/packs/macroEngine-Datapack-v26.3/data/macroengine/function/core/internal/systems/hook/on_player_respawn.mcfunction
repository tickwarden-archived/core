# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/on_player_respawn
# @s = the triggering player
data modify storage macroengine:engine _hook_fire_tmp set value {event:"player_respawn"}
function macroengine:core/internal/systems/hook/fire with storage macroengine:engine _hook_fire_tmp
data remove storage macroengine:engine _hook_fire_tmp

# Event bus
function #macroengine:events/on_respawn
