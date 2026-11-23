# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# Macro: called with storage rtwrapper:api trigger (fields: objective, reset_mode).
$data modify storage rtwrapper:triggers registry[{objective:"$(objective)"}].reset_mode set from storage rtwrapper:api trigger.reset_mode
