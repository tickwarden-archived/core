# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/locale_set [MACRO]
$data modify storage vortex:dialog_db players.p$(id).locale set value "$(locale)"
