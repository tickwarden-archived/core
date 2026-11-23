# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Direct API convenience wrapper. Put named params in storage rtwrapper:api params.
function rtwrapper:core/wrappers/internal/tp_pos with storage rtwrapper:api params
