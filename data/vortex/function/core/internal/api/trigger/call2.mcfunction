# vortex:api/trigger/internal/call2 [MACRO]
# Gated by systems/cmd_gate/check (config dynamic_cmd + cmd.dynamic permission + blocklist).

$data modify storage vortex:cmd_gate in.cmd set value "$(cmd)"
execute unless function vortex:systems/cmd_gate/check run return 0
$$(cmd)
