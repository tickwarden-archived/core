# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute if data storage guikit:work rewards[0].message.text run tellraw @s [{"text":"[guikit] ","color":"gold"},{"nbt":"rewards[0].message.text","storage":"guikit:work","color":"green"}]
execute if data storage guikit:work rewards[0].functions[0] run data modify storage guikit:act w.functions set from storage guikit:work rewards[0].functions
execute if data storage guikit:act w.functions[0] run function guikit:act/_functions
