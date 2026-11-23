# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Vortex player module — advancement relay for 'interact_vault'.
# Advancements can only reward plain functions, so this entry exists to
# forward the trigger into the internal dispatch tag, which other packs
# may extend. @s is the player who triggered the interaction.

function #vortex:core/internal/player/internal/interact_vault
