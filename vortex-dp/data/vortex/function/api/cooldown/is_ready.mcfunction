# vortex:api/cooldown/is_ready [MACRO]
$data modify storage vortex:input player set value "$(player)"
$data modify storage vortex:input key set value "$(key)"
function vortex:core/internal/core/cooldown/check with storage vortex:input {}
# check: result=0b → cooldown active. is_ready returns the inverse.
execute if data storage vortex:output {result:0b} run data modify storage vortex:output result set value 1b
execute if data storage vortex:output {result:1b} run data modify storage vortex:output result set value 0b
