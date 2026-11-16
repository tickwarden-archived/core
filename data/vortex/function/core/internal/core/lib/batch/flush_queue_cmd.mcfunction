# vortex:core/internal/core/lib/batch/flush_queue_cmd [MACRO]
# INPUT: $(delay) — cmd is NBT-copied from _bfl_cur, not macro-spliced

$data modify storage vortex:engine queue append value {cmd:"", delay:$(delay)}
data modify storage vortex:engine queue[-1].cmd set from storage vortex:engine _bfl_cur.cmd
