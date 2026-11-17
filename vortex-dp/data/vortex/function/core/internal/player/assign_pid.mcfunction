# vortex:core/internal/player/assign_pid [MACRO]
execute store result score $next_pid vortex.tmp run data get storage vortex:engine _pid_seq

scoreboard players add $next_pid vortex.tmp 1

$execute store result storage vortex:engine player_pids.$(player) int 1 run scoreboard players get $next_pid vortex.tmp
$scoreboard players operation @a[name=$(player),limit=1] vortex.pid = $next_pid vortex.tmp

execute store result storage vortex:engine _pid_seq int 1 run scoreboard players get $next_pid vortex.tmp
