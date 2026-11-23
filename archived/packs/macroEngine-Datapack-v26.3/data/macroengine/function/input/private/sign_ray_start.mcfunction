# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# Ray from player eyes along look vector. Requires @s player + rotation.
scoreboard players set @s macroengine.tmp 0
execute at @s anchored eyes positioned ^ ^ ^0.2 run function macroengine:input/private/sign_ray_loop
