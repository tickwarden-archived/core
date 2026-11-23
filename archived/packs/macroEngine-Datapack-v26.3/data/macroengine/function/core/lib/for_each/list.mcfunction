# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/for_each/list [MACRO]
$data modify storage macroengine:engine _felist_state set value {func:"$(func)"}
scoreboard players set $felist_i macroengine.tmp 0
function macroengine:core/internal/core/lib/for_each/list_step

data remove storage macroengine:engine _felist_input
data remove storage macroengine:engine _felist_state
data remove storage macroengine:engine _felist_current
