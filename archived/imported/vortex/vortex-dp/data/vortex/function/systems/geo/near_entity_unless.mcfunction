# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/geo/near_entity_unless [MACRO]
execute if data storage vortex:engine modules{geo:0b} run return 0
$execute as @a[name=$(player),limit=1] at @s unless entity @e[type=$(type),tag=$(tag),distance=..$(distance),limit=1] run $(invoke)
