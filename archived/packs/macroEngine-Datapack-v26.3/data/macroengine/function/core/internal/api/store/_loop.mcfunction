# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_loop [INTERNAL]
# Walks tmp.segs, which alternate text, name, text, name ... (#st_mode 0 = text, 1 = name).
execute unless data storage macroengine:store tmp.segs[0] run return 0
execute if score #st_mode macroengine.tmp matches 0 run function macroengine:core/internal/api/store/_step_text
execute unless data storage macroengine:store tmp.segs[0] run return 0
execute if score #st_mode macroengine.tmp matches 1 run function macroengine:core/internal/api/store/_step_name
function macroengine:core/internal/api/store/_loop
