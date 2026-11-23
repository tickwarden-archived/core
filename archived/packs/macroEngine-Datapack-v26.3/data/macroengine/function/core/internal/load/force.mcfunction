# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/load/force
# Force reload: applies immediately (no confirmation gate). Discards live
# engine state (global.loaded and everything load/all's "unless data"
# guards would otherwise preserve).

function macroengine:core/internal/load/force_apply
