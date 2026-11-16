# vortex:core/internal/systems/cb/fire_entry
# Fires the command in _cb_entry via command block.
# Reuses api/cb/internal machinery.

# Copy to input storage, reuse exec path
data modify storage vortex:input cb set from storage vortex:engine _cb_entry
function vortex:core/internal/api/cb/exec with storage vortex:input cb
data remove storage vortex:input cb
