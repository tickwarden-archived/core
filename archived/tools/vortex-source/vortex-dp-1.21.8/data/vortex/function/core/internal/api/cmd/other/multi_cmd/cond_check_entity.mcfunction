# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_check_entity
# Entity leaf: condition.entity = "<selector>". Passes if it matches at
# least one entity.

function vortex:core/internal/api/cmd/other/multi_cmd/cond_entity_exec with storage vortex:engine _mcmd_cond_eval
