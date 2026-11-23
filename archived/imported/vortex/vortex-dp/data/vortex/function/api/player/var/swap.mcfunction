# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/var/swap [MACRO]
$data modify storage vortex:engine _swap.tmp set from storage vortex:engine players.$(player_a).$(key)
$data modify storage vortex:engine players.$(player_a).$(key) set from storage vortex:engine players.$(player_b).$(key)
$data modify storage vortex:engine players.$(player_b).$(key) set from storage vortex:engine _swap.tmp
data remove storage vortex:engine _swap
