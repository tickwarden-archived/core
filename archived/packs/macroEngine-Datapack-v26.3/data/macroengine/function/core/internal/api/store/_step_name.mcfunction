# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_step_name [INTERNAL]
# The head follows an opening '%'. It is a token only when a closing '%' exists, i.e.
# another segment follows; otherwise "%" + head is kept as text.
scoreboard players set #st_mode macroengine.tmp 0
execute unless data storage macroengine:store tmp.segs[1] run data modify storage macroengine:store tmp.frags append value "%"
execute unless data storage macroengine:store tmp.segs[1] run return run function macroengine:core/internal/api/store/_step_text
function macroengine:core/internal/api/store/_resolve
data remove storage macroengine:store tmp.segs[0]
