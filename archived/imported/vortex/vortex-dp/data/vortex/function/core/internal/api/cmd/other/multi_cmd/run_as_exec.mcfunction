# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# [MACRO] INPUT: $(selector)
$execute as $(selector) run function vortex:api/cmd/other/multi_cmd/run
