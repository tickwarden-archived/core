# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(id) $(type)
$execute if score @s guikit.click matches 0 store success score @s guikit.click run clear @s *[custom_data~{guikit:{id:"$(id)"}}] 1
$execute if score @s guikit.click matches 1 run data modify storage guikit:ctx click set value {id:"$(id)",kind:"$(type)"}
execute if score @s guikit.click matches 1 run function guikit:internal/click/run_handler
