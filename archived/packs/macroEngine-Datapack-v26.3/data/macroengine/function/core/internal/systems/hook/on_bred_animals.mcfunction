# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/systems/hook/on_bred_animals [INTERNAL]
# Advancement reward. @s = the player who breeds two animals.
# Revokes the advancement first (so it can fire again, even while the pack is closed or
# the hook module is off), then fires the "bred_animals" hook event.
# ======================================================================================

advancement revoke @s only macroengine:systems/hook/bred_animals
execute if data storage macroengine:engine modules{hook:0b} run return 0
data modify storage macroengine:engine _hook_fire_tmp set value {event:"bred_animals"}
function macroengine:core/internal/systems/hook/fire with storage macroengine:engine _hook_fire_tmp
data remove storage macroengine:engine _hook_fire_tmp
