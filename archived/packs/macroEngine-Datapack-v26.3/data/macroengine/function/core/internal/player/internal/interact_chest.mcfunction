# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroEngine player module — advancement relay for 'interact_chest'.
# Advancements can only reward plain functions, so this entry exists to
# forward the trigger into the internal dispatch tag, which other packs
# may extend. Fired when the player used a chest (advancement-driven).

function #macroengine:core/internal/player/internal/interact_chest
