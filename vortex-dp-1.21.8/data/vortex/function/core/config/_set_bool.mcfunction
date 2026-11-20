# vortex:core/config/_set_bool [MACRO, INTERNAL]  $(key) is a schema key
execute store result score #cfg_in vortex.tmp run data get storage vortex:engine config_in.value
$execute if score #cfg_in vortex.tmp matches ..0 run data modify storage vortex:engine config.$(key) set value 0b
$execute if score #cfg_in vortex.tmp matches 1.. run data modify storage vortex:engine config.$(key) set value 1b
function vortex:core/config/apply
return 1
