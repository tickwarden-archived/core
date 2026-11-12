# ─────────────────────────────────────────────────────────────────
# vortex:player/is/on_ground
# Checks whether a named player is currently on the ground.
# Uses the vortex:is_on_ground predicate (entity_flags).
#
# INPUT : $(player) → player name
# OUTPUT: vortex:output result → 1b if on ground, 0b otherwise
# vortex:output found → 1b if player online, 0b otherwise
#
# EXAMPLE:
# function vortex:player/is/on_ground {player:"Steve"}
# → vortex:output result = 1b
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output found set value 0b
data modify storage vortex:output result set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] if predicate vortex:is_on_ground run data modify storage vortex:output result set value 1b
