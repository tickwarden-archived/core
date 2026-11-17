# vortex:api/dialog/locale_set [MACRO]
$data modify storage vortex:dialog_i18n ctx.locale set value "$(locale)"
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_i18n ctx.id set from storage vortex:dialog_ctx id
function vortex:core/internal/dialog/locale_set with storage vortex:dialog_i18n ctx
