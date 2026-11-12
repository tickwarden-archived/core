# vortex:core/lib/schedule/renew [MACRO]
$execute unless data storage vortex:engine schedules.$(key) run return 0
$data modify storage vortex:engine _sched_tmp set from storage vortex:engine schedules.$(key)
execute if data storage vortex:engine _sched_tmp.func if data storage vortex:engine _sched_tmp.player run function vortex:core/internal/core/lib/schedule/requeue_as with storage vortex:engine _sched_tmp
execute if data storage vortex:engine _sched_tmp.func unless data storage vortex:engine _sched_tmp.player run function vortex:core/internal/core/lib/schedule/requeue with storage vortex:engine _sched_tmp
execute if data storage vortex:engine _sched_tmp.cmd if data storage vortex:engine _sched_tmp.player run function vortex:core/internal/core/lib/schedule/requeue_cmd_as with storage vortex:engine _sched_tmp
execute if data storage vortex:engine _sched_tmp.cmd unless data storage vortex:engine _sched_tmp.player run function vortex:core/internal/core/lib/schedule/requeue_cmd with storage vortex:engine _sched_tmp
data remove storage vortex:engine _sched_tmp
