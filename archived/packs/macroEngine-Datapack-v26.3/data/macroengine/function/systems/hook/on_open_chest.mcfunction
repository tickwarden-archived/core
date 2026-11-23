# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_open_chest
# Binds a function or command to the "open_chest" event.
#
# INPUT (storage macroengine:input):
#   func → function to run when a player opens a chest
#   cmd  → command to run when a player opens a chest (used if func is absent)
#
# USAGE:
#   data modify storage macroengine:input func set value "mypack:on_open_chest"
#   function macroengine:systems/hook/on_open_chest
#   -- or --
#   data modify storage macroengine:input cmd set value "say A chest was opened"
#   function macroengine:systems/hook/on_open_chest
execute if data storage macroengine:engine modules{hook:0b} run return 0
data modify storage macroengine:input event set value "open_chest"
function macroengine:systems/hook/bind
