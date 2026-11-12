# vortex:systems/hook/internal/on_eat
# @s = the eating player
scoreboard players add @s vortex.hook_eat 1
advancement revoke @s only vortex:systems/hook/eat_food
