# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"Link: ","color":"gray"},{"nbt":"w.url","storage":"guikit:act","color":"aqua","underlined":true,"click_event":{"action":"open_url","url":""}}]
# URL open_url needs concrete string — author should put tellraw in w.commands for full control
