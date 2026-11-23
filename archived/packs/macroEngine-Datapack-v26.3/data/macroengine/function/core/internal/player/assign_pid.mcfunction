# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/assign_pid [MACRO]
execute store result score $next_pid macroengine.tmp run data get storage macroengine:engine _pid_seq

scoreboard players add $next_pid macroengine.tmp 1

$execute store result storage macroengine:engine player_pids.$(player) int 1 run scoreboard players get $next_pid macroengine.tmp
$scoreboard players operation @a[name=$(player),limit=1] macroengine.pid = $next_pid macroengine.tmp

execute store result storage macroengine:engine _pid_seq int 1 run scoreboard players get $next_pid macroengine.tmp
