# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/once/run [MACRO]
$execute if data storage macroengine:engine once_keys.$(key) run return 0

$data modify storage macroengine:engine once_keys.$(key) set value 1b

$data modify storage macroengine:engine _dispatch.func set value "$(func)"
function #macroengine:internal/dispatch
