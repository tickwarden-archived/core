# vortex:api/cmd/other/multi_cmd [MACRO]
# Executes a list of commands in order.
# INPUT (macro args): $(commands) — list of command strings/objects
#

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
$data modify storage vortex:engine _mcmd_queue set value $(commands)
data modify storage vortex:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}

execute at @s run function vortex:api/cmd/other/multi_cmd/run
