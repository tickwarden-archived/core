# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:systems/hook/on_brewed_potion
# Binds a function or command to the "brewed_potion" event (fires when a player takes a potion out of a brewing stand).
#
# INPUT (storage vortex:input):
#   func -> function to run, as the player
#   cmd  -> command to run (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_brewed_potion"
#   function vortex:systems/hook/on_brewed_potion
# ======================================================================================

execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "brewed_potion"
function vortex:systems/hook/bind
