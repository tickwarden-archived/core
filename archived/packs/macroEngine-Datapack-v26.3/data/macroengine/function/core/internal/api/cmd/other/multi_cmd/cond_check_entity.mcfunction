# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/cmd/other/multi_cmd/cond_check_entity
# Entity leaf: condition.entity = "<selector>". Passes if it matches at
# least one entity.

function macroengine:core/internal/api/cmd/other/multi_cmd/cond_entity_exec with storage macroengine:engine _mcmd_cond_eval
