# vortex:systems/hook/on_open_chest
# Binds a function or command to the "open_chest" event.
#
# INPUT (storage vortex:input):
#   func → function to run when a player opens a chest
#   cmd  → command to run when a player opens a chest (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_open_chest"
#   function vortex:systems/hook/on_open_chest
#   -- or --
#   data modify storage vortex:input cmd set value "say A chest was opened"
#   function vortex:systems/hook/on_open_chest
execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "open_chest"
function vortex:systems/hook/bind
