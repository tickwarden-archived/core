# vortex:systems/hook/on_entity_kill
# Reward: entity_kill advancement (player_killed_entity trigger)
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/entity_kill
scoreboard players add @s vortex.hook_entity_killed 1
