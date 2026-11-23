# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/locale_set [MACRO]
$data modify storage vortex:dialog_i18n ctx.locale set value "$(locale)"
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_i18n ctx.id set from storage vortex:dialog_ctx id
function vortex:core/internal/dialog/locale_set with storage vortex:dialog_i18n ctx
