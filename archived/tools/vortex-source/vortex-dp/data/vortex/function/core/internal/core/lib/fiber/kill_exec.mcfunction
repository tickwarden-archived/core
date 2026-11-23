# vortex:core/internal/core/lib/fiber/kill_exec [MACRO]
# INPUT: $(id)

$execute unless data storage vortex:engine fibers.$(id) run return 0

$data remove storage vortex:engine fibers.$(id).alive
$data remove storage vortex:engine fibers.$(id).resume
