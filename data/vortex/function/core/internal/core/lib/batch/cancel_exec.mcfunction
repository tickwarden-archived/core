# vortex:core/internal/core/lib/batch/cancel_exec [MACRO]
# INPUT: $(id)

$execute unless data storage vortex:engine batches.$(id) run return 0
$data remove storage vortex:engine batches.$(id)
