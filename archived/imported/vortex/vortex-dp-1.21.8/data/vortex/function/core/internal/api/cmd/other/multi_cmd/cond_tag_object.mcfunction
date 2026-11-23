# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_object
# Object form. `has` defaults to 1b when omitted.

data modify storage vortex:engine _mcmd_cond_tmp set from storage vortex:engine _mcmd_cond_eval.tag
execute unless data storage vortex:engine _mcmd_cond_tmp.has run data modify storage vortex:engine _mcmd_cond_tmp.has set value 1b
execute unless data storage vortex:engine _mcmd_cond_tmp.name run function vortex:core/internal/api/cmd/other/multi_cmd/cond_missing_key
function vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_obj_exec with storage vortex:engine _mcmd_cond_tmp
data remove storage vortex:engine _mcmd_cond_tmp
