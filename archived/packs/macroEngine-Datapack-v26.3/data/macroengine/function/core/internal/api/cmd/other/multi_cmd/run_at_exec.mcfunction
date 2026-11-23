# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# [MACRO] INPUT: $(selector)
$execute at $(selector) run function macroengine:api/cmd/other/multi_cmd/run
