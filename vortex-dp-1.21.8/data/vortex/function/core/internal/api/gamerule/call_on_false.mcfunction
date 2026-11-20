# vortex:core/internal/api/gamerule/call_on_false [MACRO]
# Calls the gr_on_false callback. Called by dispatch only.
execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/gamerule/call_on_false"}
$function $(gr_on_false)
