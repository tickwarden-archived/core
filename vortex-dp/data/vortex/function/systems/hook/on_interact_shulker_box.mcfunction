# vortex:systems/hook/on_interact_shulker_box
# Advancement reward: runs when player opens a shulker box
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/interact_shulker_box
function vortex:core/internal/systems/hook/on_interact_shulker_box
