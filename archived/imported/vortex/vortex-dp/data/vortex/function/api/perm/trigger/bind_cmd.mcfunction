# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/perm/trigger/bind_cmd [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
$scoreboard objectives add $(name) trigger

$execute unless data storage vortex:engine perm_triggers.$(name) run data modify storage vortex:engine perm_triggers.$(name) set value []
$data modify storage vortex:engine perm_triggers.$(name) append value {value:$(value), cmd:"$(cmd)", perm:"$(perm)"}

execute unless data storage vortex:engine perm_trigger_names run data modify storage vortex:engine perm_trigger_names set value []
$execute unless data storage vortex:engine perm_trigger_names[{name:"$(name)"}] run data modify storage vortex:engine perm_trigger_names append value {name:"$(name)"}
