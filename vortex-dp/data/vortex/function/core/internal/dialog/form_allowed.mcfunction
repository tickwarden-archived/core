# vortex:core/internal/dialog/form_allowed [MACRO]
$execute if data storage vortex:dialog_event route.rules.allowed[{value:$(value)}] run return 1
return 0
