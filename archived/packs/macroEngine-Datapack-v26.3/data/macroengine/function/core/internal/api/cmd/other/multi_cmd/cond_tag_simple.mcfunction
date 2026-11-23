# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/cmd/other/multi_cmd/cond_tag_simple
# Normalises the string shorthand into {name:"...",has:1b} and delegates.

data modify storage macroengine:engine _mcmd_cond_tmp set value {}
data modify storage macroengine:engine _mcmd_cond_tmp.name set from storage macroengine:engine _mcmd_cond_eval.tag
data modify storage macroengine:engine _mcmd_cond_tmp.has set value 1b
function macroengine:core/internal/api/cmd/other/multi_cmd/cond_tag_obj_exec with storage macroengine:engine _mcmd_cond_tmp
data remove storage macroengine:engine _mcmd_cond_tmp
