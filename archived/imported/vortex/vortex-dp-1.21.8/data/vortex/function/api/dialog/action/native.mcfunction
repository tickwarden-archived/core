# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/action/native [MACRO]
$data modify storage vortex:dialog_work dialog.actions append value {label:$(label),width:150,action:$(action)}
return 1
