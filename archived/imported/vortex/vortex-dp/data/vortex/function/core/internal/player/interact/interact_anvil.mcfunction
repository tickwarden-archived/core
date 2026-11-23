# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/player/interact/interact_anvil
advancement revoke @s only vortex:core/internal/player/interact_anvil
function #vortex:core/internal/player/interact_anvil
