# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/var/swap [MACRO]
$data modify storage macroengine:engine _swap.tmp set from storage macroengine:engine players.$(player_a).$(key)
$data modify storage macroengine:engine players.$(player_a).$(key) set from storage macroengine:engine players.$(player_b).$(key)
$data modify storage macroengine:engine players.$(player_b).$(key) set from storage macroengine:engine _swap.tmp
data remove storage macroengine:engine _swap
