# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/inv/count_item [MACRO]
scoreboard players set $inv_cnt macroengine.tmp 0
$execute as @a[name=$(player),limit=1] run execute store result score $inv_cnt macroengine.tmp run clear @s *[minecraft:custom_data=$(custom_data)] 0
execute store result storage macroengine:output count int 1 run scoreboard players get $inv_cnt macroengine.tmp
