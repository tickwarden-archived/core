# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/on_jump
# Bridge: #macroengine:core/internal/player/jumped → #macroengine:events/on_jump
# Executor: @s = jumping player
function #macroengine:events/on_jump
