# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/once/run [MACRO]
$execute if data storage vortex:engine once_keys.$(key) run return 0

$data modify storage vortex:engine once_keys.$(key) set value 1b

$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
