# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/geo/as_nearby_player [MACRO]
execute if data storage vortex:engine modules{geo:0b} run return 0
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @a[distance=..$(distance),limit=1,sort=nearest] at @s run function #vortex:internal/dispatch
