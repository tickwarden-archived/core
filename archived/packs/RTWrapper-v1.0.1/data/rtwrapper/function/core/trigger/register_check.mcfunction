# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Macro: called with storage rtwrapper:api trigger (fields: objective, action, reset_mode).
# Fails (no-op) if the objective is already registered.
$execute if data storage rtwrapper:triggers registry[{objective:"$(objective)"}] run return fail
function rtwrapper:core/trigger/register_apply with storage rtwrapper:api trigger
