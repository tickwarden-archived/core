# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/i18n_player [MACRO]
$execute if data storage vortex:dialog_db players.p$(id).locale run data modify storage vortex:dialog_i18n ctx.locale set from storage vortex:dialog_db players.p$(id).locale
