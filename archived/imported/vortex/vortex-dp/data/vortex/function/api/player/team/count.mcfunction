# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/team/count [MACRO]
scoreboard players set $team_cnt vortex.tmp 0
$execute as @a[team=$(team)] run scoreboard players add $team_cnt vortex.tmp 1
execute store result storage vortex:output result int 1 run scoreboard players get $team_cnt vortex.tmp
