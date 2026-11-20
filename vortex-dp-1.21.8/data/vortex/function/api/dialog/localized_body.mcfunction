# vortex:api/dialog/localized_body [MACRO]
$function vortex:api/dialog/translate {key:"$(key)"}
data modify storage vortex:dialog_i18n args.text set from storage vortex:dialog_i18n result
$data modify storage vortex:dialog_i18n args.width set value $(width)
function vortex:api/dialog/body with storage vortex:dialog_i18n args
