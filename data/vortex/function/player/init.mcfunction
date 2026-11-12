# vortex:player/init [MACRO]
$execute unless data storage vortex:engine players.$(player) run data modify storage vortex:engine players.$(player) set value {}
$execute unless data storage vortex:engine players.$(player).coins run data modify storage vortex:engine players.$(player).coins set value 0
$execute unless data storage vortex:engine players.$(player).level run data modify storage vortex:engine players.$(player).level set value 1
$execute unless data storage vortex:engine players.$(player).xp run data modify storage vortex:engine players.$(player).xp set value 0
$data modify storage vortex:engine players.$(player).online set value 1b
$execute unless data storage vortex:engine players.$(player).first_join_tick run execute store result storage vortex:engine players.$(player).first_join_tick int 1 run scoreboard players get $epoch vortex.time
$execute store result storage vortex:engine players.$(player).last_join_tick int 1 run scoreboard players get $epoch vortex.time
$execute unless data storage vortex:engine player_pids.$(player) run function vortex:core/internal/player/assign_pid with storage vortex:engine _pid_init_tmp
