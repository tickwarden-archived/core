# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:world/entity/count [MACRO]
scoreboard players set $ent_count vortex.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run scoreboard players add $ent_count vortex.tmp 1
execute store result storage vortex:output count int 1 run scoreboard players get $ent_count vortex.tmp
