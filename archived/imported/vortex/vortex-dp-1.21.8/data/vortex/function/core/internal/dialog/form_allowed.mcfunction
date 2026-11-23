# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/form_allowed [MACRO]
$execute if data storage vortex:dialog_event route.rules.allowed[{value:$(value)}] run return 1
return 0
