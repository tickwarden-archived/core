# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:input/sign
# Call as player: execute as <player> at @s run function macroengine:input/sign
execute unless entity @s[type=minecraft:player] run return fail
function macroengine:input/private/sign_ray_start
