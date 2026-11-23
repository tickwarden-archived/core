# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/queue/exec_fn
# Runs a queued function in server (non-entity) context.
# Called with storage vortex:engine _wq_job as macro source.
#
# Macro input:
#   fn — function path to call

$data modify storage vortex:engine _dispatch.func set value "$(fn)"
function #vortex:internal/dispatch
