# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/queue/size
# Writes the current work_queue item count to macroengine:output queue.size.
# No macro input required.
#
# Output (macroengine:output queue):
#   size — int  number of pending items
#
# Usage:
#   function macroengine:core/queue/size
#   data get storage macroengine:output queue.size

execute store result storage macroengine:output queue.size int 1 run data get storage macroengine:engine work_queue
