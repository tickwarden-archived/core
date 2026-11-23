# ─────────────────────────────────────────────────────────────────
# vortex:api/player/get/air
# Returns the current air supply of the named player.
# Air ranges from 0 (drowning) to 300 (full) in ticks.
#
# INPUT : $(player) → player name
# OUTPUT: vortex:output result → air ticks (int, 0–300)
#         vortex:output found  → 1b if player online, 0b otherwise
#
# EXAMPLE:
#   function vortex:api/player/get/air {player:"Steve"}
#   → vortex:output result = 300
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] store result storage vortex:output result int 1 run data get entity @s Air
