# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_open_gui
# Bridge: #vortex:core/internal/player/open_gui → #vortex:events/on_open_gui
# Executor: @s = player who opened a GUI block
function #vortex:events/on_open_gui
