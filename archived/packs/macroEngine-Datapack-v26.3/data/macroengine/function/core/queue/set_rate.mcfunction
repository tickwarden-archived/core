# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/queue/set_rate
# Sets how many work_queue items are processed per tick.
# Default: 1. Raise for faster throughput; lower to reduce tick cost.
# A value of 0 pauses processing.
#
# Input  (macroengine:input queue):
#   rate — integer ≥ 0
#
# Usage:
#   data modify storage macroengine:input queue.rate set value 4
#   function macroengine:core/queue/set_rate with storage macroengine:input queue

$data modify storage macroengine:engine work_queue_rate set value $(rate)
