# vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_simple
# Normalises the string shorthand into {name:"...",has:1b} and delegates.

data modify storage vortex:engine _mcmd_cond_tmp set value {}
data modify storage vortex:engine _mcmd_cond_tmp.name set from storage vortex:engine _mcmd_cond_eval.tag
data modify storage vortex:engine _mcmd_cond_tmp.has set value 1b
function vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_obj_exec with storage vortex:engine _mcmd_cond_tmp
data remove storage vortex:engine _mcmd_cond_tmp
