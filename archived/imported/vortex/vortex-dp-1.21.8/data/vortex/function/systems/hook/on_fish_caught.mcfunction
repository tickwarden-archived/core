# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/hook/on_fish_caught
# Binds a function or command to the "fish_caught" event.
#
# INPUT (storage vortex:input):
#   func → function to run when a player catches a fish
#   cmd  → command to run when a player catches a fish (used if func is absent)
#
# USAGE:
#   data modify storage vortex:input func set value "mypack:on_fish"
#   function vortex:systems/hook/on_fish_caught
#   -- or --
#   data modify storage vortex:input cmd set value "give @s salmon 1"
#   function vortex:systems/hook/on_fish_caught
execute if data storage vortex:engine modules{hook:0b} run return 0
data modify storage vortex:input event set value "fish_caught"
function vortex:systems/hook/bind
