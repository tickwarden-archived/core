# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/config/get
# Reads one runtime config value.
# INPUT  vortex:engine config_in.key   any key from docs/config.md
# OUTPUT vortex:output result          the value (removed first, so a stale value never survives a miss)
# RETURN 1 when the key exists, 0 otherwise.
data remove storage vortex:output result
execute unless data storage vortex:engine config_in.key run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:engine config_in.key
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:engine config_k set value {}
data modify storage vortex:engine config_k.key set from storage vortex:engine config_in.key
function vortex:core/config/_get_exec with storage vortex:engine config_k
execute if data storage vortex:output result run return 1
return 0
