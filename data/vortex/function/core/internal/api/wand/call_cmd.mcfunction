# vortex:api/wand/internal/call_cmd [MACRO]

$data modify storage vortex:cmd_gate in.cmd set value "$(cmd)"
execute unless function vortex:systems/cmd_gate/check run return 0
execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/api/wand/call_cmd"}
$$(cmd)
