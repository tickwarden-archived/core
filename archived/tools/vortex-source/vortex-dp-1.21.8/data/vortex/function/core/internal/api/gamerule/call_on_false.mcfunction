# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/gamerule/call_on_false [MACRO]
# Calls the gr_on_false callback. Called by dispatch only.
execute if data storage vortex:engine modules{macro_function:0b} run return run function vortex:core/internal/callback/blocked/function {site:"core/internal/api/gamerule/call_on_false"}
$function $(gr_on_false)
