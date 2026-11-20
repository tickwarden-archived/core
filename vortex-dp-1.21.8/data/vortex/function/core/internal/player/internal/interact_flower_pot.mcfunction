# Vortex player module — advancement relay for 'interact_flower_pot'.
# Advancements can only reward plain functions, so this entry exists to
# forward the trigger into the internal dispatch tag, which other packs
# may extend. @s is the player who triggered the interaction.

function #vortex:core/internal/player/internal/interact_flower_pot
