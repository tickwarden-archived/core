# vortex:api/dialog/button_label [MACRO]
# Replace the last action label with a complete text component before conversion/show.
execute unless data storage vortex:dialog_work dialog.actions[-1] run return 0
$data modify storage vortex:dialog_work dialog.actions[-1].label set value $(label)
return 1
