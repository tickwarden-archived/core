# vortex:systems/hook/on_dimension_change
# Advancement reward: runs when changed_dimension triggers.
# @s = player who changed dimension

execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/dimension_change
scoreboard players add @s vortex.hook_dim_changed 1
