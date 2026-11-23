# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:events/count [MACRO]
data modify storage macroengine:output result set value 0
$execute if data storage macroengine:engine events.$(event) run execute store result storage macroengine:output result int 1 run data get storage macroengine:engine events.$(event)
