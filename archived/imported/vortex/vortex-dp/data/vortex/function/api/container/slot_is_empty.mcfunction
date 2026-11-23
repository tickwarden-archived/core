# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/container/slot_is_empty
# Condition: is this slot empty?
# INPUT  vortex:input x, y, z, slot
# RETURN 1 when the block is a container and the slot is empty, else 0.
# OUTPUT vortex:output container {ok} tells a real container from a bad input.
execute if data storage vortex:engine modules{container:0b} run return 0
function vortex:core/internal/api/container/slot_get_do
execute if data storage vortex:output container{ok:1b,empty:1b} run return 1
return 0
