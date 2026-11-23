# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/internal/exec_func_macro [MACRO]
# INPUT: $(func)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/cmd/other/multi_cmd/exec_func_macro"}
$function $(func)
