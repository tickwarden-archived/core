# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/time_of/set [MACRO]
# Helper for vortex:api/cmd/time_of {action:"set"}; see that function.
$time set $(value)
