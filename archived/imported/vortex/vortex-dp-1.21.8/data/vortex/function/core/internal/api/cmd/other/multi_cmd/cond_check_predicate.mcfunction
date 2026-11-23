# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_check_predicate
# Predicate leaf: condition.predicate = "namespace:path". Evaluated as @s.

function vortex:core/internal/api/cmd/other/multi_cmd/cond_pred_exec with storage vortex:engine _mcmd_cond_eval
