# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/unbind_all
# Clears all hook binds.

execute if data storage macroengine:engine modules{hook:0b} run return 0
data modify storage macroengine:engine hook_binds set value []
