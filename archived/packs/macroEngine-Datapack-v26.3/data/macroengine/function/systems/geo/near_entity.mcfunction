# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/geo/near_entity [MACRO]
execute if data storage macroengine:engine modules{geo:0b} run return 0
$execute as @a[name=$(player),limit=1] at @s if entity @e[type=$(type),tag=$(tag),distance=..$(distance),limit=1] run $(invoke)
