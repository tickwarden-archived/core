# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/batch/internal/add_cmd [MACRO]
# INPUT: $(id) — cmd is NBT-copied from macroengine:input, not macro-spliced
# Called with cmd field guaranteed.

$data modify storage macroengine:engine batches.$(id).items append value {cmd:""}
$data modify storage macroengine:engine batches.$(id).items[-1].cmd set from storage macroengine:input cmd
