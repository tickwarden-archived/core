# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/inv/clear_custom [MACRO]
$execute as @a[name=$(player),limit=1] run clear @s $(item)[minecraft:custom_data=$(custom_data)] $(count)
