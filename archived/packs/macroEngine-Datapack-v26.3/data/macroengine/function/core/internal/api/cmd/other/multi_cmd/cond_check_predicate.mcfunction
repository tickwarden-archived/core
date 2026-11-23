# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/cmd/other/multi_cmd/cond_check_predicate
# Predicate leaf: condition.predicate = "namespace:path". Evaluated as @s.

function macroengine:core/internal/api/cmd/other/multi_cmd/cond_pred_exec with storage macroengine:engine _mcmd_cond_eval
