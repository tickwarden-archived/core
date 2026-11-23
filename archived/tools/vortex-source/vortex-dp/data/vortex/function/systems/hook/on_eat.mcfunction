# vortex:systems/hook/on_eat
# Binds a function or command to the "eat" event.
#
# INPUT (storage vortex:input):
#   func → function to run when a player eats
#   cmd  → command to run when a player eats (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_eat"
#   function vortex:systems/hook/on_eat
#   -- or --
#   data modify storage vortex:input cmd set value "say I ate something"
#   function vortex:systems/hook/on_eat
execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "eat"
function vortex:systems/hook/bind
