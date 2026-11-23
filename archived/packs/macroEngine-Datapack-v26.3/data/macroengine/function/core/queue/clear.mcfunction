# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/queue/clear
# Discards all pending work_queue items immediately.
# No macro input required.
#
# Usage:
#   function macroengine:core/queue/clear

data modify storage macroengine:engine work_queue set value []
