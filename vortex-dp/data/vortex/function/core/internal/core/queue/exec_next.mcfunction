# vortex:core/internal/core/queue/exec_next
# Pops work_queue[0] into _wq_job, removes it from the list,
# then dispatches to the appropriate runner.
# player field present → execute as that player (skipped if offline).
# player field absent  → run in server context.

data modify storage vortex:engine _wq_job set from storage vortex:engine work_queue[0]
data remove storage vortex:engine work_queue[0]

execute if data storage vortex:engine _wq_job.player run function vortex:core/internal/core/queue/exec_as with storage vortex:engine _wq_job
execute unless data storage vortex:engine _wq_job.player run function vortex:core/internal/core/queue/exec_fn with storage vortex:engine _wq_job

data remove storage vortex:engine _wq_job
