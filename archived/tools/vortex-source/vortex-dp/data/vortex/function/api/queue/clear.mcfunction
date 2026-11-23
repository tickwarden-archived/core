# vortex:api/queue/clear
# Discards all pending work_queue items immediately.
# No macro input required.
#
# Usage:
#   function vortex:api/queue/clear

data modify storage vortex:engine work_queue set value []
