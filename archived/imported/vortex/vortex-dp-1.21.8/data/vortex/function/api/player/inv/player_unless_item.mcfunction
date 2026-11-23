# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/inv/player_unless_item [MACRO]
$execute as @a[name=$(player),limit=1] at @s unless items entity @s contents $(item)[minecraft:custom_data=$(custom_data)] run $(invoke)
