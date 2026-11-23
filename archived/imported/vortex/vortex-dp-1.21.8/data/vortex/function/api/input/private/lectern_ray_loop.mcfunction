# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/input/private/lectern_ray_loop  [INTERNAL]
# ======================================================================================

execute if block ~ ~ ~ minecraft:lectern run return run function vortex:api/input/private/lectern_capture

scoreboard players add @s vortex.tmp 1
execute if score @s vortex.tmp matches 50.. run return 0
execute positioned ^ ^ ^0.1 run function vortex:api/input/private/lectern_ray_loop
