# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_enchant
# Bridge: #vortex:core/internal/player/enchanted → #vortex:events/on_enchant
# Executor: @s = player who enchanted
function #vortex:events/on_enchant
