# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/state/toggle [MACRO]
scoreboard players set $st_tog vortex.tmp 0
$execute if data storage vortex:engine {states:{$(player):"$(on)"}} run scoreboard players set $st_tog vortex.tmp 1

$execute if score $st_tog vortex.tmp matches 1 run data modify storage vortex:engine states.$(player) set value "$(off)"
$execute if score $st_tog vortex.tmp matches 0 run data modify storage vortex:engine states.$(player) set value "$(on)"

data remove storage vortex:output result
$data modify storage vortex:output result set from storage vortex:engine states.$(player)
