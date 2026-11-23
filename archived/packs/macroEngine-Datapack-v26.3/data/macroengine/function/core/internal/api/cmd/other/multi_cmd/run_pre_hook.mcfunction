# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# Pre-hook runner
function macroengine:core/internal/api/cmd/other/multi_cmd/hook_pre_exec with storage macroengine:engine _mcmd_current
