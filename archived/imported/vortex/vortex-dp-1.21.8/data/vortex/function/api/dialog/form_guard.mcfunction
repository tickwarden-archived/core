# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/form_guard [MACRO]
# Attach the same predicate mechanism to the current numeric form.
$data modify storage vortex:dialog_work form.guard set value "$(guard)"
