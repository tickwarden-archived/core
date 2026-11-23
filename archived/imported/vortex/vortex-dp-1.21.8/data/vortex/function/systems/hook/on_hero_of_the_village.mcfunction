# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/hook/on_hero_of_the_village
# Reward: hero_of_the_village advancement (raid victory)
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/hero_of_the_village
scoreboard players add @s vortex.hook_hero_of_the_village 1
