# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/new_player [MACRO]
$data modify storage vortex:dialog_db players.p$(id) set value {history:[],catalog:{},view:{},frame:{}}
