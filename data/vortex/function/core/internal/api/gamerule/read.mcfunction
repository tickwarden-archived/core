# vortex:api/gamerule/internal/read [MACRO]
# Reads gamerule value from engine storage into output.
# Called by get only.
$execute if data storage vortex:engine gamerules.$(_gamerule_norm) run data modify storage vortex:output gamerule set from storage vortex:engine gamerules.$(_gamerule_norm)
