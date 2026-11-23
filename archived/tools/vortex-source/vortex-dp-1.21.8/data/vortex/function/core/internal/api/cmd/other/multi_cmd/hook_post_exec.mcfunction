# [MACRO] INPUT: $(post_hook)
execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/cmd/other/multi_cmd/hook_post_exec"}
$function $(post_hook)
