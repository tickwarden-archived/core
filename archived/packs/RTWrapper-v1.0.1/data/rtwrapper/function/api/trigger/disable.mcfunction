# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# Disable a registered RTWrapper trigger (score changes are ignored by poll until
# re-enabled). No-op if unregistered.
# Required storage keys: trigger.objective (string).
execute unless data storage rtwrapper:api trigger.objective run return fail
data modify storage rtwrapper:api trigger.enabled set value 0b
function rtwrapper:core/trigger/set_enabled with storage rtwrapper:api trigger
data remove storage rtwrapper:api trigger
