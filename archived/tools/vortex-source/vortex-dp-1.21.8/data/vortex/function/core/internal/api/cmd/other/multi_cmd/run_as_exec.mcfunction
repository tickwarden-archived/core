# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# [MACRO] INPUT: $(selector)
$execute as $(selector) run function vortex:api/cmd/other/multi_cmd/run
