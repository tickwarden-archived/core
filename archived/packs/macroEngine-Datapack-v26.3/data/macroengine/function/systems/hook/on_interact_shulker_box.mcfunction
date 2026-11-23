# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_interact_shulker_box
# Advancement reward: runs when player opens a shulker box
execute if data storage macroengine:engine modules{hook:0b} run return 0
advancement revoke @s only macroengine:systems/hook/interact_shulker_box
function macroengine:core/internal/systems/hook/on_interact_shulker_box
