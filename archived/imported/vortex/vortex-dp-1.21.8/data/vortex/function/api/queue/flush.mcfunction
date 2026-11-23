# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/queue/flush
# Processes ALL remaining work_queue items in a single tick.
# WARNING: large queues will cause a lag spike. Use only when you know
#          the queue is small (< ~50 items) or in a controlled context.
# No macro input required.
#
# Usage:
#   function vortex:api/queue/flush

execute if data storage vortex:engine work_queue[0] run function vortex:core/internal/core/queue/flush_loop
