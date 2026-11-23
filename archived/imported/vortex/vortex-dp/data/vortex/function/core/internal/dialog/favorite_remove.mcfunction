# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/favorite_remove [MACRO]
$return run data remove storage vortex:dialog_db players.p$(id).favorites[{key:"$(key)"}]
