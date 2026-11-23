# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/debounce/run [MACRO]
$execute if data storage macroengine:engine schedules.$(key) run return 0

function macroengine:core/runtime/schedule with storage macroengine:input {}
