# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/theme_apply [MACRO]
$execute unless data storage vortex:dialog_themes entries.$(key) run return 0
$data modify storage vortex:dialog_work theme set from storage vortex:dialog_themes entries.$(key)
data modify storage vortex:dialog_work dialog.columns set from storage vortex:dialog_work theme.columns
function vortex:core/internal/dialog/theme_title
return 1
