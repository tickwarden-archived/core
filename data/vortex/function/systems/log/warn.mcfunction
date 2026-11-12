# vortex:systems/log/warn
# Usage: $function vortex:systems/log/warn {message:"[System] Something suspicious"}
# Level: 2
execute if data storage vortex:engine modules{log:0b} run return 0
$data modify storage vortex:engine _log_add_tmp.message set value "$(message)"
data modify storage vortex:engine _log_add_tmp.level set value "WARN"
data modify storage vortex:engine _log_add_tmp.color set value "yellow"
execute if score #vortex.log_level vortex.log_level matches 2.. run function vortex:systems/log/add with storage vortex:engine _log_add_tmp
