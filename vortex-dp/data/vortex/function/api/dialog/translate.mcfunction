# vortex:api/dialog/translate [MACRO]
$data modify storage vortex:dialog_i18n ctx.key set value "$(key)"
$data modify storage vortex:dialog_i18n result set value {text:"[missing: $(key)]",color:"red"}
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_i18n ctx.id set from storage vortex:dialog_ctx id
data modify storage vortex:dialog_i18n ctx.fallback set from storage vortex:dialog_config fallback_locale
data modify storage vortex:dialog_i18n ctx.locale set from storage vortex:dialog_config fallback_locale
function vortex:core/internal/dialog/i18n_player with storage vortex:dialog_i18n ctx
function vortex:core/internal/dialog/i18n_lookup with storage vortex:dialog_i18n ctx
