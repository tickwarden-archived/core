# vortex:core/internal/dialog/favorites_read [MACRO]
data modify storage vortex:dialog_filter queue set value []
$execute if data storage vortex:dialog_db players.p$(id).favorites run data modify storage vortex:dialog_filter queue set from storage vortex:dialog_db players.p$(id).favorites
