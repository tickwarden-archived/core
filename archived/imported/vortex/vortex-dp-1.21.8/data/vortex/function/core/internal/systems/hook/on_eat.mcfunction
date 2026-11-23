# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_eat
# @s = the eating player
scoreboard players add @s vortex.hook_eat 1
advancement revoke @s only vortex:systems/hook/eat_food
