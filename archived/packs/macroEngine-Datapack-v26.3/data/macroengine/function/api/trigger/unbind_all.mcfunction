# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/trigger/unbind_all
execute if data storage macroengine:engine modules{trigger:0b} run return 0
data modify storage macroengine:engine trigger_binds set value []
