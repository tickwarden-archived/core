# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/tick/time_systems
scoreboard players add $epoch macroengine.time 1
scoreboard players add $tick macroengine.tmp 1

scoreboard players set $pq_depth macroengine.tmp 0
