# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/team/count [MACRO]
scoreboard players set $team_cnt macroengine.tmp 0
$execute as @a[team=$(team)] run scoreboard players add $team_cnt macroengine.tmp 1
execute store result storage macroengine:output result int 1 run scoreboard players get $team_cnt macroengine.tmp
