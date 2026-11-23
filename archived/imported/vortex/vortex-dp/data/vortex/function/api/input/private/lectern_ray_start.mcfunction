# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/input/private/lectern_ray_start  [INTERNAL]
# ======================================================================================

scoreboard players set @s vortex.tmp 0
execute anchored eyes positioned ^ ^ ^0.1 run function vortex:api/input/private/lectern_ray_loop
