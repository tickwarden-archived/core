# vortex:systems/hook/on_drop
# Binds a function or command to the "drop_item" event.
#
# INPUT (storage vortex:input):
#   func → function to run when a player drops an item
#   cmd  → command to run when a player drops an item (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_drop"
#   function vortex:systems/hook/on_drop
#   -- or --
#   data modify storage vortex:input cmd set value "say An item was dropped"
#   function vortex:systems/hook/on_drop
execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "drop_item"
function vortex:systems/hook/bind
