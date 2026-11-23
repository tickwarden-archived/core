# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# Macro: called with storage rtwrapper:api trigger (fields: objective, action).
$data modify storage rtwrapper:triggers registry[{objective:"$(objective)"}].action set from storage rtwrapper:api trigger.action
