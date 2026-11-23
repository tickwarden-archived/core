# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
tellraw @s [{"text":"[guikit] ","color":"gold"},{"nbt":"w.success_message.text","storage":"guikit:act","color":"green"}]
