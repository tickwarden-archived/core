# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/title [MACRO]
$data modify storage vortex:dialog_work dialog.title set value $(text)
function vortex:core/internal/dialog/theme_title
