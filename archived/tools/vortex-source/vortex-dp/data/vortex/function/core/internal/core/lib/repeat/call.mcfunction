# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/repeat/call [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
