# Ray from player eyes along look vector. Requires @s player + rotation.
scoreboard players set @s vortex.tmp 0
execute at @s anchored eyes positioned ^ ^ ^0.2 run function vortex:api/input/private/sign_ray_loop
