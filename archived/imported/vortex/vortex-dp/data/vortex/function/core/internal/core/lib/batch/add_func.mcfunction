# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/batch/add_func [MACRO]
# INPUT: $(id) — func is NBT-copied from vortex:input, not macro-spliced
# Called with func field guaranteed.

$data modify storage vortex:engine batches.$(id).items append value {func:""}
$data modify storage vortex:engine batches.$(id).items[-1].func set from storage vortex:input func
