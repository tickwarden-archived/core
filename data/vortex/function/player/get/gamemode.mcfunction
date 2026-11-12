# vortex:player/get/gamemode [MACRO]
# Returns the gamemode of a named player as an integer.
#
# INPUT:  $(player) — player name
# OUTPUT: vortex:output result — 0=survival, 1=creative, 2=adventure, 3=spectator
# vortex:output name — "survival" | "creative" | "adventure" | "spectator"
# vortex:output found — 1b if player exists, 0b otherwise
#
# EXAMPLE:
# function vortex:player/get/gamemode {player:"Steve"}
# data get storage vortex:output name

data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b

$execute if entity @a[name=$(player),gamemode=survival,limit=1] run data modify storage vortex:output result set value 0
$execute if entity @a[name=$(player),gamemode=creative,limit=1] run data modify storage vortex:output result set value 1
$execute if entity @a[name=$(player),gamemode=adventure,limit=1] run data modify storage vortex:output result set value 2
$execute if entity @a[name=$(player),gamemode=spectator,limit=1] run data modify storage vortex:output result set value 3

$execute if entity @a[name=$(player),gamemode=survival,limit=1] run data modify storage vortex:output name set value "survival"
$execute if entity @a[name=$(player),gamemode=creative,limit=1] run data modify storage vortex:output name set value "creative"
$execute if entity @a[name=$(player),gamemode=adventure,limit=1] run data modify storage vortex:output name set value "adventure"
$execute if entity @a[name=$(player),gamemode=spectator,limit=1] run data modify storage vortex:output name set value "spectator"
