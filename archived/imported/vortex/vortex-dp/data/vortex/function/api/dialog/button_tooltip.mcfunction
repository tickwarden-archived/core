# vortex:api/dialog/button_tooltip [MACRO]
# Whole-component substitution preserves rich tooltips and quoting.
execute unless data storage vortex:dialog_work dialog.actions[-1] run return 0
$data modify storage vortex:dialog_work dialog.actions[-1].tooltip set value $(text)
return 1
