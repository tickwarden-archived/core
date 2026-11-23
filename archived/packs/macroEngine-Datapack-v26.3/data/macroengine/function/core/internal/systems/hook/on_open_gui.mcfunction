# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/on_open_gui
# Bridge: #macroengine:core/internal/player/open_gui → #macroengine:events/on_open_gui
# Executor: @s = player who opened a GUI block
function #macroengine:events/on_open_gui
