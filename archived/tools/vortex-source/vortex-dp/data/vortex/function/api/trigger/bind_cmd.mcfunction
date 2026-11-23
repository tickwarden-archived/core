# vortex:api/trigger/bind_cmd [MACRO]
execute if data storage vortex:engine modules{trigger:0b} run return 0
execute unless data storage vortex:engine trigger_binds run data modify storage vortex:engine trigger_binds set value []

$data modify storage vortex:engine trigger_binds append value {value:$(value), cmd:"$(cmd)"}
