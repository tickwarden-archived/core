# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/gamerule/internal/call_on_false [MACRO]
# Calls the gr_on_false callback. Called by dispatch only.
$function $(gr_on_false)
