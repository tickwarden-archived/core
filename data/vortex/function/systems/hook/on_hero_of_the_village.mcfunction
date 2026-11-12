# vortex:systems/hook/on_hero_of_the_village
# Reward: hero_of_the_village advancement (raid victory)
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/hero_of_the_village
scoreboard players add @s vortex.hook_hero_of_the_village 1
