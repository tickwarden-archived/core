# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/for_each/list [MACRO]
$data modify storage vortex:engine _felist_state set value {func:"$(func)"}
scoreboard players set $felist_i vortex.tmp 0
function vortex:core/internal/core/lib/for_each/list_step

data remove storage vortex:engine _felist_input
data remove storage vortex:engine _felist_state
data remove storage vortex:engine _felist_current
