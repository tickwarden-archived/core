# vortex:systems/hook/on_target_hit
# Binds a function or command to the "target_hit" event.
#
# INPUT (storage vortex:input):
#   func → function to run when a player hits a target block
#   cmd  → command to run when a player hits a target block (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_target_hit"
#   function vortex:systems/hook/on_target_hit
#   -- or --
#   data modify storage vortex:input cmd set value "say Target hit"
#   function vortex:systems/hook/on_target_hit
execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "target_hit"
function vortex:systems/hook/bind
