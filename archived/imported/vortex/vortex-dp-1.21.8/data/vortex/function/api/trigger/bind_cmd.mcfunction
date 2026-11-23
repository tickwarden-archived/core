# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/trigger/bind_cmd [MACRO]
execute if data storage vortex:engine modules{trigger:0b} run return 0
execute unless data storage vortex:engine trigger_binds run data modify storage vortex:engine trigger_binds set value []

$data modify storage vortex:engine trigger_binds append value {value:$(value), cmd:"$(cmd)"}
