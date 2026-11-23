# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/localized_body [MACRO]
$function vortex:api/dialog/translate {key:"$(key)"}
data modify storage vortex:dialog_i18n args.text set from storage vortex:dialog_i18n result
$data modify storage vortex:dialog_i18n args.width set value $(width)
function vortex:api/dialog/body with storage vortex:dialog_i18n args
