# vortex:core/internal/core/lib/queue/run_cmd_as [MACRO]
$data modify storage vortex:cmd_gate in.cmd set value "$(cmd)"
execute unless function vortex:systems/cmd_gate/check run return 0
$execute as $(player) at @s run $(cmd)
