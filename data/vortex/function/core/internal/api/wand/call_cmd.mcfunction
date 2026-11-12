# vortex:api/wand/internal/call_cmd [MACRO]

$data modify storage vortex:cmd_gate in.cmd set value "$(cmd)"
execute unless function vortex:systems/cmd_gate/check run return 0
$$(cmd)
