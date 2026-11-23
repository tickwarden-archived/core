# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/gamerule/internal/read [MACRO]
# Reads gamerule value from engine storage into output.
# Called by get only.
$execute if data storage macroengine:engine gamerules.$(_gamerule_norm) run data modify storage macroengine:output gamerule set from storage macroengine:engine gamerules.$(_gamerule_norm)
