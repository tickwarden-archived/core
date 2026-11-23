# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/hook/on_jump
# Binds a function or command to the "jumped" event.
#
# INPUT (storage vortex:input):
#   func → function to run when a player jumps
#   cmd  → command to run when a player jumps (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_jump"
#   function vortex:systems/hook/on_jump
#   -- or --
#   data modify storage vortex:input cmd set value "say A player jumped"
#   function vortex:systems/hook/on_jump
execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "jumped"
function vortex:systems/hook/bind
