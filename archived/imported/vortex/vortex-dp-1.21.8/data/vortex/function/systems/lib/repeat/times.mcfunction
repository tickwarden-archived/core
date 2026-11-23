# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/repeat/times [MACRO]
$scoreboard players set $rn_n vortex.tmp $(n)
scoreboard players set $rn_i vortex.tmp 0

execute if score $rn_n vortex.tmp matches ..0 run return 0

$data modify storage vortex:engine _rn_func set value "$(func)"
function vortex:core/internal/core/lib/repeat/times_loop
data remove storage vortex:engine _rn_func
