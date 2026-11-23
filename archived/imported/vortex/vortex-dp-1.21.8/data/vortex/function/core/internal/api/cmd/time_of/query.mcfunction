# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/time_of/query [MACRO]
# Helper for vortex:api/cmd/time_of {action:"query"}; see that function.
# $(value) is a 1.21.8 time query argument: `daytime`, `gametime` or `day`.
$return run time query $(value)
