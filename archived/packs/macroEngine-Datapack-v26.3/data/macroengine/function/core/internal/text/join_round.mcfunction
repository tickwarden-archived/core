# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/join_round [INTERNAL] one reduction round, repeats until one entry is left
data modify storage macroengine:text nl set value []
function macroengine:core/internal/text/join_take
data modify storage macroengine:text pc set from storage macroengine:text nl
execute if data storage macroengine:text pc[1] run function macroengine:core/internal/text/join_round
