# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute if data storage guikit:act w.condition.fail_message.text run tellraw @s [{"text":"[guikit] ","color":"gold"},{"nbt":"w.condition.fail_message.text","storage":"guikit:act","color":"red"}]
execute unless data storage guikit:act w.condition.fail_message.text run tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"Condition failed.","color":"red"}]
scoreboard players set @s guikit.click 2
