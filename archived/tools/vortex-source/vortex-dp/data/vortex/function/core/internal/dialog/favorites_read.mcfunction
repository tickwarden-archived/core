# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/favorites_read [MACRO]
data modify storage vortex:dialog_filter queue set value []
$execute if data storage vortex:dialog_db players.p$(id).favorites run data modify storage vortex:dialog_filter queue set from storage vortex:dialog_db players.p$(id).favorites
