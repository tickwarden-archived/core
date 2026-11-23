# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/events/uro_loop
function vortex:core/internal/events/uro_check with storage vortex:engine _uro.src[0]
data remove storage vortex:engine _uro.src[0]
execute if data storage vortex:engine _uro.src[0] run function vortex:core/internal/events/uro_loop
