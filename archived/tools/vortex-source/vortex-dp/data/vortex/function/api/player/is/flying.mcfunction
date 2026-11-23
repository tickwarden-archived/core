# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/is/flying
# Checks whether the named player is currently flying (creative/spectator flight or elytra).
# Params: player
# Output: vortex:output result = 1b (flying) or 0b (not flying / not found)
# vortex:output found = 1b if player exists online, else 0b

data modify storage vortex:output result set value 0b
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] if data entity @s {abilities:{flying:1b}} run data modify storage vortex:output result set value 1b
