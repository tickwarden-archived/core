# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/core/lib/repeat/times_call [MACRO]
$data modify storage macroengine:engine _dispatch.func set value "$(_rn_func)"
function #macroengine:internal/dispatch
