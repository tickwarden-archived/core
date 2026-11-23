# vortex:api/player/var/swap [MACRO]
$data modify storage vortex:engine _swap.tmp set from storage vortex:engine players.$(player_a).$(key)
$data modify storage vortex:engine players.$(player_a).$(key) set from storage vortex:engine players.$(player_b).$(key)
$data modify storage vortex:engine players.$(player_b).$(key) set from storage vortex:engine _swap.tmp
data remove storage vortex:engine _swap
