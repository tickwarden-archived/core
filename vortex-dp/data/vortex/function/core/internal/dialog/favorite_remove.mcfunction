# vortex:core/internal/dialog/favorite_remove [MACRO]
$return run data remove storage vortex:dialog_db players.p$(id).favorites[{key:"$(key)"}]
