# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:events/unregister_one [MACRO]
$execute unless data storage macroengine:engine events.$(event) run return 0

$data modify storage macroengine:engine _uro.event set value "$(event)"
$data modify storage macroengine:engine _uro.func set value "$(func)"
$data modify storage macroengine:engine _uro.src set from storage macroengine:engine events.$(event)

$data remove storage macroengine:engine events.$(event)

execute if data storage macroengine:engine _uro.src[0] run function macroengine:core/internal/events/uro_loop

data remove storage macroengine:engine _uro
