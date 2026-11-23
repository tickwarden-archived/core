# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Modify an existing trigger's action and/or reset_mode. No-op if unregistered.
# Required storage keys: trigger.objective (string).
# Optional: trigger.action (compound), trigger.reset_mode ("value"|"keep").
execute unless data storage rtwrapper:api trigger.objective run return fail
function rtwrapper:core/trigger/modify_check with storage rtwrapper:api trigger
data remove storage rtwrapper:api trigger
