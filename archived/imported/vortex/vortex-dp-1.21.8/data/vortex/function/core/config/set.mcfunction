# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/config/set
# Sets one runtime config value, validated against the schema and applied at once.
# Unknown keys, wrong value types and unsafe strings change nothing.
#
# INPUT  vortex:engine config_in.key    any key from docs/config.md (e.g. "hud_rate", "module_store")
#        vortex:engine config_in.value  bool keys: 0b/1b (or any number, > 0 = on)
#                                            int keys: a number, clamped to the key's range
#                                            string keys: a string (safe characters only, length-limited)
# RETURN 1 when the value was applied, 0 otherwise.
#
# Usage:
#   data modify storage vortex:engine config_in set value {key:"hud_rate",value:5}
#   function vortex:core/config/set
execute unless data storage vortex:engine config_in.value run return 0
execute unless data storage vortex:engine config_in.key run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:engine config_in.key
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:engine config_k set value {}
data modify storage vortex:engine config_k.key set from storage vortex:engine config_in.key
return run function vortex:core/config/_set_lookup with storage vortex:engine config_k
