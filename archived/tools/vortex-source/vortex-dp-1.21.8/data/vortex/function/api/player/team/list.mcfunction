# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/team/list
tellraw @a[tag=vortex.admin] {"text":"[Team] -- Registered Teams --","color":"aqua"}
tellraw @a[tag=vortex.admin] {"nbt":"teams","plain":true ,"storage":"vortex:engine","interpret":false,"color":"white"}
tellraw @a[tag=vortex.admin] {"text":"[Team] ---------------------","color":"aqua"}
