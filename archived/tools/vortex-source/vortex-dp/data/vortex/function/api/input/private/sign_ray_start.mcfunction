# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Ray from player eyes along look vector. Requires @s player + rotation.
scoreboard players set @s vortex.tmp 0
execute at @s anchored eyes positioned ^ ^ ^0.2 run function vortex:api/input/private/sign_ray_loop
