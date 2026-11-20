# vortex:api/dialog/localized_button [MACRO]
$function vortex:api/dialog/translate {key:"$(key)"}
$data modify storage vortex:dialog_i18n button set value {callback:$(callback),payload:$(payload)}
data modify storage vortex:dialog_i18n button.label set from storage vortex:dialog_i18n result
function vortex:api/dialog/button with storage vortex:dialog_i18n button
