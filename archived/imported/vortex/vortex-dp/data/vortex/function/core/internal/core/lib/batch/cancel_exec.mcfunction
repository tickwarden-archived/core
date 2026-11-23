# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/batch/cancel_exec [MACRO]
# INPUT: $(id)

$execute unless data storage vortex:engine batches.$(id) run return 0
$data remove storage vortex:engine batches.$(id)
