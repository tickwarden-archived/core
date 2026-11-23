# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/trigger/bind [MACRO]
execute if data storage macroengine:engine modules{trigger:0b} run return 0
execute unless data storage macroengine:engine trigger_binds run data modify storage macroengine:engine trigger_binds set value []

$data modify storage macroengine:engine trigger_binds append value {value:$(value), func:"$(func)"}
