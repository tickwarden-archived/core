# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/batch/internal/flush_queue_func [MACRO]
# INPUT: $(delay) — func is NBT-copied from _bfl_cur, not macro-spliced

$data modify storage macroengine:engine queue append value {func:"", delay:$(delay)}
data modify storage macroengine:engine queue[-1].func set from storage macroengine:engine _bfl_cur.func
