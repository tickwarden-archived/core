# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(id)
$execute if data storage guikit:lib menus.$(id) run scoreboard players set #ok guikit.const 1
$execute unless data storage guikit:lib menus.$(id) run tellraw @s [{"text":"[guikit] ","color":"gold"},{"text":"unknown menu: $(id)","color":"red"}]
