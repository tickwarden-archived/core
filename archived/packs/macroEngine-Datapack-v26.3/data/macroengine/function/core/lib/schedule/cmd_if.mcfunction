# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/schedule/cmd_if
function macroengine:core/lib/queue/add_cmd with storage macroengine:input {}
