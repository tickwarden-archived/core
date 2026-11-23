# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/core/lib/queue/run_cmd_as [MACRO]
$data modify storage macroengine:cmd_gate in.cmd set value "$(cmd)"
execute unless function macroengine:systems/cmd_gate/check run return 0
$execute as $(player) at @s run function macroengine:core/dispatch/cmd with storage macroengine:cmd_gate in
