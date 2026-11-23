# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/batch/add_cmd [MACRO]
# INPUT: $(id) — cmd is NBT-copied from vortex:input, not macro-spliced
# Called with cmd field guaranteed.

$data modify storage vortex:engine batches.$(id).items append value {cmd:""}
$data modify storage vortex:engine batches.$(id).items[-1].cmd set from storage vortex:input cmd
