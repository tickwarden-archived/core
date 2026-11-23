# vortex:api/container/slot_clear
# Empties one slot.
# INPUT  vortex:input x, y, z, slot
# OUTPUT vortex:output container {ok}
# RETURN 1 on success, 0 on bad input or a block without an inventory.
execute if data storage vortex:engine modules{container:0b} run return 0
return run function vortex:core/internal/api/container/slot_clear_do
