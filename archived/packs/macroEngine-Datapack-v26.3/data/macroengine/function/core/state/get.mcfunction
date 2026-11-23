# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/state/get [MACRO]
data remove storage macroengine:output result
$execute if data storage macroengine:engine states.$(player) run data modify storage macroengine:output result set from storage macroengine:engine states.$(player)
