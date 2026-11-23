# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/join_round [INTERNAL] one reduction round, repeats until one entry is left
data modify storage vortex:text nl set value []
function vortex:core/internal/text/join_take
data modify storage vortex:text pc set from storage vortex:text nl
execute if data storage vortex:text pc[1] run function vortex:core/internal/text/join_round
