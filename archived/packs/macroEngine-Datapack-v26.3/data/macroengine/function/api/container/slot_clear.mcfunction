# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/container/slot_clear
# Empties one slot.
# INPUT  macroengine:input x, y, z, slot
# OUTPUT macroengine:output container {ok}
# RETURN 1 on success, 0 on bad input or a block without an inventory.
execute if data storage macroengine:engine modules{container:0b} run return 0
return run function macroengine:core/internal/api/container/slot_clear_do
