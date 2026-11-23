# vortex:api/state/toggle [MACRO]
scoreboard players set $st_tog vortex.tmp 0
$execute if data storage vortex:engine {states:{$(player):"$(on)"}} run scoreboard players set $st_tog vortex.tmp 1

$execute if score $st_tog vortex.tmp matches 1 run data modify storage vortex:engine states.$(player) set value "$(off)"
$execute if score $st_tog vortex.tmp matches 0 run data modify storage vortex:engine states.$(player) set value "$(on)"

data remove storage vortex:output result
$data modify storage vortex:output result set from storage vortex:engine states.$(player)
