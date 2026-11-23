# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/queue/run_func_as [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as $(player) at @s run function #vortex:internal/dispatch
