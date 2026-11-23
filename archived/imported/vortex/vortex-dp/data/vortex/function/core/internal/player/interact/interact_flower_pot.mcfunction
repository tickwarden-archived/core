# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/player/interact/interact_flower_pot
advancement revoke @s only vortex:core/internal/player/interact_flower_pot
function #vortex:core/internal/player/interact_flower_pot
