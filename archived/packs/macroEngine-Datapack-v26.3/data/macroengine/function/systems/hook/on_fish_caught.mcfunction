# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_fish_caught
# Binds a function or command to the "fish_caught" event.
#
# INPUT (storage macroengine:input):
#   func → function to run when a player catches a fish
#   cmd  → command to run when a player catches a fish (used if func is absent)
#
# USAGE:
#   data modify storage macroengine:input func set value "mypack:on_fish"
#   function macroengine:systems/hook/on_fish_caught
#   -- or --
#   data modify storage macroengine:input cmd set value "give @s salmon 1"
#   function macroengine:systems/hook/on_fish_caught
execute if data storage macroengine:engine modules{hook:0b} run return 0
data modify storage macroengine:input event set value "fish_caught"
function macroengine:systems/hook/bind
