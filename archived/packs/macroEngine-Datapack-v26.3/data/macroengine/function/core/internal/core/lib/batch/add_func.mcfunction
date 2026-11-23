# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/batch/internal/add_func [MACRO]
# INPUT: $(id) — func is NBT-copied from macroengine:input, not macro-spliced
# Called with func field guaranteed.

$data modify storage macroengine:engine batches.$(id).items append value {func:""}
$data modify storage macroengine:engine batches.$(id).items[-1].func set from storage macroengine:input func
