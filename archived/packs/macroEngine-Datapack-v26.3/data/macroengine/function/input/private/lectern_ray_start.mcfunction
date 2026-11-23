# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:input/private/lectern_ray_start  [INTERNAL]
# ======================================================================================

scoreboard players set @s macroengine.tmp 0
execute anchored eyes positioned ^ ^ ^0.1 run function macroengine:input/private/lectern_ray_loop
