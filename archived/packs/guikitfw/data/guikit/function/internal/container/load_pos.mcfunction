# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute store result storage guikit:work x int 1 run scoreboard players get @s guikit.bx
execute store result storage guikit:work y int 1 run scoreboard players get @s guikit.by
execute store result storage guikit:work z int 1 run scoreboard players get @s guikit.bz
