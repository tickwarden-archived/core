# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/inv/player_if_item [MACRO]
$execute as @a[name=$(player),limit=1] at @s if items entity @s contents $(item)[minecraft:custom_data=$(custom_data)] run $(invoke)
