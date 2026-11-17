# vortex:api/queue/push_as
# Appends a function to the work queue, tagged to execute AS a specific player.
# The player must be online when the item is processed; if offline, it is skipped.
#
# Input  (vortex:input queue):
#   fn     — function path          e.g. "mypack:process_player"
#   player — player name or UUID    e.g. "<player name>"
#
# Usage:
#   data modify storage vortex:input queue set value {fn:"mypack:process_player",player:"<player name>"}
#   function vortex:api/queue/push_as with storage vortex:input queue

$data modify storage vortex:engine work_queue append value {fn:"$(fn)",player:"$(player)"}
