# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/favorite_set [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).favorites run data modify storage vortex:dialog_db players.p$(id).favorites set value []
$execute store result score #favorites vortex.dialog_tmp run data get storage vortex:dialog_db players.p$(id).favorites
$execute if score #favorites vortex.dialog_tmp matches 64.. unless data storage vortex:dialog_db players.p$(id).favorites[{key:"$(key)"}] run return 0
$data remove storage vortex:dialog_db players.p$(id).favorites[{key:"$(key)"}]
$data modify storage vortex:dialog_db players.p$(id).favorites append value {key:"$(key)",item:$(item)}
return 1
