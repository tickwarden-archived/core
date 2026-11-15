# vortex:api/gamerule/internal/call_on_true [MACRO]
# Calls the gr_on_true callback. Called by dispatch only.
execute if data storage vortex:engine modules{macro_function:0b} run return 0
$function $(gr_on_true)
