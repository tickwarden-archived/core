# vortex:core/internal/dialog/favorite_get [MACRO]
data modify storage vortex:dialog_favorites result set value {}
data modify storage vortex:dialog_favorites found set value 0b
$execute unless data storage vortex:dialog_db players.p$(id).favorites[{key:"$(key)"}] run return 0
$data modify storage vortex:dialog_favorites result set from storage vortex:dialog_db players.p$(id).favorites[{key:"$(key)"}].item
data modify storage vortex:dialog_favorites found set value 1b
return 1
