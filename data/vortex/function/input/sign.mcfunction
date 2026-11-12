# vortex:input/sign
# Call as player: execute as <player> at @s run function vortex:input/sign
execute unless entity @s[type=minecraft:player] run return fail
function vortex:input/private/sign_ray_start
