# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/queue/clear
# Discards all pending work_queue items immediately.
# No macro input required.
#
# Usage:
#   function vortex:api/queue/clear

data modify storage vortex:engine work_queue set value []
