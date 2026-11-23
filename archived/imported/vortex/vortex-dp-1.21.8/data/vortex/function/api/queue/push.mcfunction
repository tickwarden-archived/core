# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/queue/push
# Appends a function call to the rate-limited work queue.
# The engine will execute it at up to work_queue_rate calls/tick.
#
# DIFFERENT from lib/queue_add:
#   lib/queue_add  → delay-based scheduler (run after N ticks)
#   queue/push     → throughput limiter   (process heavy lists without lag spikes)
#
# Input  (vortex:input queue):
#   fn — fully-qualified function path  e.g. "mypack:do_thing"
#
# Usage:
#   data modify storage vortex:input queue.fn set value "mypack:do_thing"
#   function vortex:api/queue/push with storage vortex:input queue

$data modify storage vortex:engine work_queue append value {fn:"$(fn)"}
