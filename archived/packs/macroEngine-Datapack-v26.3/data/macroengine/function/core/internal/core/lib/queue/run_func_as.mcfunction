# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/core/lib/queue/run_func_as [MACRO]
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
$execute as $(player) at @s run function #macroengine:internal/dispatch
