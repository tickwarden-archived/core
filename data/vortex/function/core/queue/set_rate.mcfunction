# vortex:core/queue/set_rate
# Sets how many work_queue items are processed per tick.
# Default: 1. Raise for faster throughput; lower to reduce tick cost.
# A value of 0 pauses processing.
#
# Input  (vortex:input queue):
#   rate — integer ≥ 0
#
# Usage:
#   data modify storage vortex:input queue.rate set value 4
#   function vortex:core/queue/set_rate with storage vortex:input queue

$data modify storage vortex:engine work_queue_rate set value $(rate)
