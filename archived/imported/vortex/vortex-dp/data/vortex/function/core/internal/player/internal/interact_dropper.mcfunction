# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Vortex player module — advancement relay for 'interact_dropper'.
# Advancements can only reward plain functions, so this entry exists to
# forward the trigger into the internal dispatch tag, which other packs
# may extend. @s is the player who triggered the interaction.

function #vortex:core/internal/player/internal/interact_dropper
