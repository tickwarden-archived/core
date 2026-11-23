# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/time_of/query [MACRO]
# Helper for vortex:api/cmd/time_of {action:"query"}; see that function.
# $(value) is a 26.x time query argument: `gametime`, a timeline id such as
# `day` (ticks into the current repetition), or `<timeline> repetition`.
$return run time query $(value)
