# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# Detect click (slot empty after interaction)
$execute as @a[name=$(player),limit=1] at @s if items entity @s player.cursor $(item)[minecraft:custom_data=$(data)] run $(invoke)
