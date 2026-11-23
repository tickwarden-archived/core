# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/interact/interact_trapped_chest
advancement revoke @s only macroengine:core/internal/player/interact_trapped_chest
function #macroengine:core/internal/player/interact_trapped_chest
