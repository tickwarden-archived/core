# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/once/cmd [MACRO]
$execute if data storage macroengine:engine once_keys.$(key) run return 0

$data modify storage macroengine:cmd_gate in.cmd set value "$(cmd)"
execute unless function macroengine:systems/cmd_gate/check run return 0
$data modify storage macroengine:engine once_keys.$(key) set value 1b

function macroengine:core/dispatch/cmd with storage macroengine:cmd_gate in
