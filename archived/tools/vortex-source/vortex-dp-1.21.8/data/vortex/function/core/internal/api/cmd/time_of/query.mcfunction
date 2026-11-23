# vortex:core/internal/api/cmd/time_of/query [MACRO]
# Helper for vortex:api/cmd/time_of {action:"query"}; see that function.
# $(value) is a 1.21.8 time query argument: `daytime`, `gametime` or `day`.
$return run time query $(value)
