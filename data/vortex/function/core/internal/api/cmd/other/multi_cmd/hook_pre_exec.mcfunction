# [MACRO] INPUT: $(pre_hook)
execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/cmd/other/multi_cmd/hook_pre_exec"}
$function $(pre_hook)
