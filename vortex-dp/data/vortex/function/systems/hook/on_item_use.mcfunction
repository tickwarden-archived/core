# vortex:systems/hook/on_item_use
# Reward: item_use advancement (using_item trigger)
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/item_use
scoreboard players add @s vortex.hook_item_used 1
