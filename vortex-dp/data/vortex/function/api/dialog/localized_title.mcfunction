# vortex:api/dialog/localized_title [MACRO]
$function vortex:api/dialog/translate {key:"$(key)"}
data modify storage vortex:dialog_i18n args.text set from storage vortex:dialog_i18n result
function vortex:api/dialog/title with storage vortex:dialog_i18n args
