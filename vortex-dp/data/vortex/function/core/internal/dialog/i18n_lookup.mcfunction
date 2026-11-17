# vortex:core/internal/dialog/i18n_lookup [MACRO]
$execute if data storage vortex:dialog_translations entries.$(fallback).$(key) run data modify storage vortex:dialog_i18n result set from storage vortex:dialog_translations entries.$(fallback).$(key)
$execute if data storage vortex:dialog_translations entries.$(locale).$(key) run data modify storage vortex:dialog_i18n result set from storage vortex:dialog_translations entries.$(locale).$(key)
