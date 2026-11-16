# vortex:core/internal/core/lib/once/cmd [MACRO]
$execute if data storage vortex:engine once_keys.$(key) run return 0

$data modify storage vortex:engine once_keys.$(key) set value 1b

$$(cmd)
