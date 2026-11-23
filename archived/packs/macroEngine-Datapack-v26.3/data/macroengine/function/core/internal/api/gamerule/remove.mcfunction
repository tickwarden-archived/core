# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/gamerule/internal/remove [MACRO]
# Removes a single gamerule key from engine storage.
# Called by reset only.
$data remove storage macroengine:engine gamerules.$(_gamerule_norm)
