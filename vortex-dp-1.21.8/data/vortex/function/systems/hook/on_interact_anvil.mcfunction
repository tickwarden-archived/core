# vortex:systems/hook/on_interact_anvil
# Advancement reward: runs when player interacts with an anvil
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/interact_anvil
function vortex:core/internal/systems/hook/on_interact_anvil
