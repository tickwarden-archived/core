# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/log/info
# Usage: $function vortex:systems/log/info {message:"[System] Something happened"}
# Level: 3
execute if data storage vortex:engine modules{log:0b} run return 0
$data modify storage vortex:engine _log_add_tmp.message set value "$(message)"
data modify storage vortex:engine _log_add_tmp.level set value "INFO"
data modify storage vortex:engine _log_add_tmp.color set value "gray"
execute if score #vortex.log_level vortex.log_level matches 3.. run function vortex:systems/log/add with storage vortex:engine _log_add_tmp
