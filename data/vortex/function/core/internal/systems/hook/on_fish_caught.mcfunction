# vortex:systems/hook/internal/on_fish_caught
# @s = the fishing player
scoreboard players add @s vortex.hook_fish 1
advancement revoke @s only vortex:systems/hook/fish_caught
