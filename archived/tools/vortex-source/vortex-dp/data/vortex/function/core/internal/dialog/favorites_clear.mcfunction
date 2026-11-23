# vortex:core/internal/dialog/favorites_clear [MACRO]
$data modify storage vortex:dialog_db players.p$(id).favorites set value []
return 1
