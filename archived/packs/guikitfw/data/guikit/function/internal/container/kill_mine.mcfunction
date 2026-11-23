# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
scoreboard players operation #pid guikit.tmp = @s guikit.pid
execute as @e[type=#guikit:container,tag=guikit.cart] if score @s guikit.pid = #pid guikit.tmp run kill @s
