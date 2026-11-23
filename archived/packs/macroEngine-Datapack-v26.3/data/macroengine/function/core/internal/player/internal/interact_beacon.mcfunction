# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroEngine player module — advancement relay for 'interact_beacon'.
# Advancements can only reward plain functions, so this entry exists to
# forward the trigger into the internal dispatch tag, which other packs
# may extend. @s is the player who triggered the interaction.

function #macroengine:core/internal/player/internal/interact_beacon
