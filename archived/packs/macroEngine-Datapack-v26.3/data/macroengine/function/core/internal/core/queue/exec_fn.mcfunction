# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/queue/internal/exec_fn
# Runs a queued function in server (non-entity) context.
# Called with storage macroengine:engine _wq_job as macro source.
#
# Macro input:
#   fn — function path to call

$data modify storage macroengine:engine _dispatch.func set value "$(fn)"
function #macroengine:internal/dispatch
