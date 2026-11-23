# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/input/sign
# Call as player: execute as <player> at @s run function vortex:api/input/sign
execute unless entity @s[type=minecraft:player] run return fail
function vortex:api/input/private/sign_ray_start
