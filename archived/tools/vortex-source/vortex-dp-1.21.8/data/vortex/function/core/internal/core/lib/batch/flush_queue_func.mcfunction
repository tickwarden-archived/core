# vortex:core/internal/core/lib/batch/flush_queue_func [MACRO]
# INPUT: $(delay) — func is NBT-copied from _bfl_cur, not macro-spliced

$data modify storage vortex:engine queue append value {func:"", delay:$(delay)}
data modify storage vortex:engine queue[-1].func set from storage vortex:engine _bfl_cur.func
