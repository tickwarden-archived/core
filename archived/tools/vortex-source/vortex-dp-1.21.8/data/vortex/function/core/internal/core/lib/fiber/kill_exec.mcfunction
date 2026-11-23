# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/fiber/kill_exec [MACRO]
# INPUT: $(id)

$execute unless data storage vortex:engine fibers.$(id) run return 0

$data remove storage vortex:engine fibers.$(id).alive
$data remove storage vortex:engine fibers.$(id).resume
