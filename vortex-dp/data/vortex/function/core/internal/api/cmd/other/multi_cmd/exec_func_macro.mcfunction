# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/internal/exec_func_macro [MACRO]
# INPUT: $(func)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/cmd/other/multi_cmd/exec_func_macro"}
$function $(func)
