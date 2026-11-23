# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/geo/as_nearby_player [MACRO]
execute if data storage macroengine:engine modules{geo:0b} run return 0
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
$execute as @a[distance=..$(distance),limit=1,sort=nearest] at @s run function #macroengine:internal/dispatch
