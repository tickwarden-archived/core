# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/interact/interact_shulker_box
advancement revoke @s only macroengine:core/internal/player/interact_shulker_box
function #macroengine:core/internal/player/interact_shulker_box
