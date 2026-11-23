# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/get/online_count
scoreboard players set $poc macroengine.tmp 0
execute as @a run scoreboard players add $poc macroengine.tmp 1
execute store result storage macroengine:output result int 1 run scoreboard players get $poc macroengine.tmp
