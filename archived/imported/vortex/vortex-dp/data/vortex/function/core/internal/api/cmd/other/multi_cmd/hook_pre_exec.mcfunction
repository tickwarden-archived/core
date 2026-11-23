# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# [MACRO] INPUT: $(pre_hook)
execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/cmd/other/multi_cmd/hook_pre_exec"}
$function $(pre_hook)
