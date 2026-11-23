# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/trigger/call [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
