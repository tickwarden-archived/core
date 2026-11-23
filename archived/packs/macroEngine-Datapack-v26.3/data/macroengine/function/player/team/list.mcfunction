# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/team/list
tellraw @a[tag=macroengine.admin] {"text":"[Team] -- Registered Teams --","color":"aqua"}
tellraw @a[tag=macroengine.admin] {"nbt":"teams","plain":true ,"storage":"macroengine:engine","interpret":false,"color":"white"}
tellraw @a[tag=macroengine.admin] {"text":"[Team] ---------------------","color":"aqua"}
