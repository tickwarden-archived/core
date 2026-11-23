# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/config/_set_str [MACRO, INTERNAL]  $(key) is a schema key
# The string must pass safe_name (no quotes, backslashes, braces, whitespace...) and fit the key's max length.
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:engine config_in.value
execute unless function vortex:systems/validate/safe_name run return 0
execute store result score #cfg_len vortex.tmp run data get storage vortex:engine config_in.value
execute store result score #cfg_max vortex.tmp run data get storage vortex:engine config_sc.max
execute if score #cfg_len vortex.tmp > #cfg_max vortex.tmp run return 0
$data modify storage vortex:engine config.$(key) set string storage vortex:engine config_in.value
function vortex:core/config/apply
return 1
