# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/interaction/unbind_attack [MACRO]
execute if data storage vortex:engine modules{interaction:0b} run return 0
execute unless data storage vortex:engine interaction_binds.attack[0] run return 0

data modify storage vortex:engine _ia_ubinds set from storage vortex:engine interaction_binds.attack
data modify storage vortex:engine interaction_binds.attack set value []
$data modify storage vortex:engine _ia_ufilter set value {tag:"$(tag)", func:"$(func)", list:"attack"}
function vortex:core/internal/api/interaction/unbind_filter
data remove storage vortex:engine _ia_ubinds
data remove storage vortex:engine _ia_ufilter
