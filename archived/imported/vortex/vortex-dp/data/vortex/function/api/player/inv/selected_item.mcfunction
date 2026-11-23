# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/inv/selected_item [MACRO]
$execute as @a[name=$(player),limit=1] as @a at @s if items entity @s weapon.mainhand $(item)[minecraft:custom_data=$(custom_data)] run $(invoke)
