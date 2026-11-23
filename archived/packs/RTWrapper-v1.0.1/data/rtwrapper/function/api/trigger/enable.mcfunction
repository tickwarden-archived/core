# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Enable a registered RTWrapper trigger (it will fire again when set). No-op if unregistered
# or already enabled.
# Required storage keys: trigger.objective (string).
execute unless data storage rtwrapper:api trigger.objective run return fail
function rtwrapper:core/trigger/set_enabled with storage rtwrapper:api trigger
data remove storage rtwrapper:api trigger
