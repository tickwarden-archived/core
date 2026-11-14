# ─────────────────────────────────────────────────────────────────
# vortex:player/is/swimming
# Checks whether the named player is currently swimming.
# Uses the vortex:is_swimming predicate (entity_flags).
#
# INPUT : $(player) → player name
# OUTPUT: vortex:output result → 1b if swimming, 0b otherwise
#         vortex:output found  → 1b if player online, 0b otherwise
#
# EXAMPLE:
#   function vortex:player/is/swimming {player:"Steve"}
#   → vortex:output result = 1b
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output result set value 0b
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] if predicate vortex:is_swimming run data modify storage vortex:output result set value 1b
