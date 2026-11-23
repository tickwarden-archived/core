# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/button_label [MACRO]
# Replace the last action label with a complete text component before conversion/show.
execute unless data storage vortex:dialog_work dialog.actions[-1] run return 0
$data modify storage vortex:dialog_work dialog.actions[-1].label set value $(label)
return 1
