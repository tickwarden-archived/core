# ======================================================================================
# vortex:systems/hook/on_bred_animals
# Binds a function or command to the "bred_animals" event (fires when a player breeds two animals).
#
# INPUT (storage vortex:input):
#   func -> function to run, as the player
#   cmd  -> command to run (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_bred_animals"
#   function vortex:systems/hook/on_bred_animals
# ======================================================================================

execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "bred_animals"
function vortex:systems/hook/bind
