# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Hit any sign-like block
execute if block ~ ~ ~ #minecraft:all_signs run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ #minecraft:signs run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ #minecraft:wall_signs run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ #minecraft:standing_signs run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ #minecraft:ceiling_hanging_signs run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ #minecraft:wall_hanging_signs run return run function vortex:api/input/private/sign_capture
# Explicit common ids (tag miss safety)
execute if block ~ ~ ~ minecraft:oak_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:oak_wall_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:birch_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:birch_wall_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:spruce_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:spruce_wall_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:dark_oak_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:dark_oak_wall_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:mangrove_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:cherry_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:bamboo_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:crimson_sign run return run function vortex:api/input/private/sign_capture
execute if block ~ ~ ~ minecraft:warped_sign run return run function vortex:api/input/private/sign_capture

scoreboard players add @s vortex.tmp 1
execute if score @s vortex.tmp matches 40.. run return 0
execute positioned ^ ^ ^0.25 run function vortex:api/input/private/sign_ray_loop
