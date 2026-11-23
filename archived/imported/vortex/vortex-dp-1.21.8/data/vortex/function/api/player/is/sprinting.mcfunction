# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/player/is/sprinting
# Checks whether a named player is currently sprinting.
# Uses the vortex:is_sprinting predicate (entity_flags).
#
# INPUT : $(player) → player name
# OUTPUT: vortex:output result → 1b if sprinting, 0b otherwise
# vortex:output found → 1b if player online, 0b otherwise
#
# EXAMPLE:
# function vortex:api/player/is/sprinting {player:"Steve"}
# → vortex:output result = 1b
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output found set value 0b
data modify storage vortex:output result set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] if predicate vortex:is_sprinting run data modify storage vortex:output result set value 1b
