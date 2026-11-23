# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/queue/size
# Writes the current work_queue item count to vortex:output queue.size.
# No macro input required.
#
# Output (vortex:output queue):
#   size — int  number of pending items
#
# Usage:
#   function vortex:api/queue/size
#   data get storage vortex:output queue.size

execute store result storage vortex:output queue.size int 1 run data get storage vortex:engine work_queue
