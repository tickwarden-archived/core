# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/gamerule/read [MACRO]
# Reads gamerule value from engine storage into output.
# Called by get only.
$execute if data storage vortex:engine gamerules.$(_gamerule_norm) run data modify storage vortex:output gamerule set from storage vortex:engine gamerules.$(_gamerule_norm)
