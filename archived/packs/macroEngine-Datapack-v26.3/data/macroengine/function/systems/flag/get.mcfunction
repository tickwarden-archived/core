# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/flag/get [MACRO]
data modify storage macroengine:output result set value 0b
$execute if data storage macroengine:engine flags.$(key) run data modify storage macroengine:output result set value 1b
