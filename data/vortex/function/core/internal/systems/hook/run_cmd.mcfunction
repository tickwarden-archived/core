# vortex:systems/hook/internal/run_cmd [MACRO]
# INPUT: $(cmd)
# @s = the triggering player
# Gated by systems/cmd_gate/check (config dynamic_cmd + cmd.dynamic permission + blocklist).
$data modify storage vortex:cmd_gate in.cmd set value "$(cmd)"
execute unless function vortex:systems/cmd_gate/check run return 0
execute if data storage vortex:engine modules{macro_cmd:0b} run return 0
$$(cmd)
