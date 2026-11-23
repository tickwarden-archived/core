# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/inv/clear_custom [MACRO]
$execute as @a[name=$(player),limit=1] run clear @s $(item)[minecraft:custom_data=$(custom_data)] $(count)
