# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"Could not open menu (container spawn failed).","color":"red"}]
scoreboard players set #ok guikit.const 0
