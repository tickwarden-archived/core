# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/entity/count [MACRO]
scoreboard players set $ent_count macroengine.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run scoreboard players add $ent_count macroengine.tmp 1
execute store result storage macroengine:output count int 1 run scoreboard players get $ent_count macroengine.tmp
