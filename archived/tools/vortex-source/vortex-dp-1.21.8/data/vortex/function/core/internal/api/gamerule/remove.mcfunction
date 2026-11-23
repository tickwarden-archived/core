# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/gamerule/remove [MACRO]
# Removes a single gamerule key from engine storage.
# Called by reset only.
$data remove storage vortex:engine gamerules.$(_gamerule_norm)
