# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_jump
# Bridge: #vortex:core/internal/player/jumped → #vortex:events/on_jump
# Executor: @s = jumping player
function #vortex:events/on_jump
