# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/container/slot_set
# Writes an item into one slot (replaces what was there).
#
# INPUT  vortex:input x, y, z, slot, item {id:"minecraft:stone", count:1..99 (default 1), components:{...}}
# OUTPUT vortex:output container {ok}
# RETURN 1 on success, 0 on bad input or a block without an inventory.
# The item compound is stored as data, it is never pasted into a command. Use a real item id:
# the game decides at load time whether the entry is valid.
execute if data storage vortex:engine modules{container:0b} run return 0
return run function vortex:core/internal/api/container/slot_set_do
