# vortex:core/queue/size
# Writes the current work_queue item count to vortex:output queue.size.
# No macro input required.
#
# Output (vortex:output queue):
#   size — int  number of pending items
#
# Usage:
#   function vortex:core/queue/size
#   data get storage vortex:output queue.size

execute store result storage vortex:output queue.size int 1 run data get storage vortex:engine work_queue
