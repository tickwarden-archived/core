# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/player/interact/interact_loom
advancement revoke @s only vortex:core/internal/player/interact_loom
function #vortex:core/internal/player/interact_loom
