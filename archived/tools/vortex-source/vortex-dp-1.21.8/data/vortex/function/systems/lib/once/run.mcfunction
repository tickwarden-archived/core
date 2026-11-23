# vortex:systems/lib/once/run [MACRO]
$execute if data storage vortex:engine once_keys.$(key) run return 0

$data modify storage vortex:engine once_keys.$(key) set value 1b

$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
