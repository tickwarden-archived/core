# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/on_enchant
# Bridge: #macroengine:core/internal/player/enchanted → #macroengine:events/on_enchant
# Executor: @s = player who enchanted
function #macroengine:events/on_enchant
