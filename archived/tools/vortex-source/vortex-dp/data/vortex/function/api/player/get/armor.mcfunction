# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/player/get/armor
# Returns the armor point value of the named player.
# Armor is read from the generic.armor attribute base value.
# Also returns armor toughness.
#
# INPUT : $(player) → player name
# OUTPUT: vortex:output result → armor points (int)
# vortex:output toughness → armor toughness (int, scaled x1000)
# vortex:output found → 1b if player exists, 0b otherwise
#
# EXAMPLE:
# function vortex:api/player/get/armor {player:"Steve"}
# data get storage vortex:output result
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] store result storage vortex:output result int 1 run data get entity @s Attributes[{Name:"minecraft:armor"}].Base
$execute as @a[name=$(player),limit=1] store result storage vortex:output toughness int 1000 run data get entity @s Attributes[{Name:"minecraft:armor_toughness"}].Base
