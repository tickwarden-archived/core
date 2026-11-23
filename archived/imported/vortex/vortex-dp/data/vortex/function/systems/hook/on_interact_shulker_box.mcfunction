# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/hook/on_interact_shulker_box
# Advancement reward: runs when player opens a shulker box
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/interact_shulker_box
function vortex:core/internal/systems/hook/on_interact_shulker_box
