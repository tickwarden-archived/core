# ─────────────────────────────────────────────────────────────────
# vortex:player/is/gliding
# Checks whether the named player is currently gliding with an elytra.
# Uses the vortex:is_gliding predicate (entity_flags).
#
# INPUT : $(player) → player name
# OUTPUT: vortex:output result → 1b if gliding, 0b otherwise
#         vortex:output found  → 1b if player online, 0b otherwise
#
# EXAMPLE:
#   function vortex:player/is/gliding {player:"Steve"}
#   → vortex:output result = 1b
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output result set value 0b
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] if predicate vortex:is_gliding run data modify storage vortex:output result set value 1b
