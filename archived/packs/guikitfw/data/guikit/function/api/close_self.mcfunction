# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# /trigger guikit.close
scoreboard players set @s guikit.close 0
scoreboard players enable @s guikit.close
execute unless score @s guikit.timer matches 1.. run tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"No open menu.","color":"red"}]
execute unless score @s guikit.timer matches 1.. run return 0
function guikit:api/close
