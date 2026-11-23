# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/inv/count_item [MACRO]
scoreboard players set $inv_cnt vortex.tmp 0
$execute as @a[name=$(player),limit=1] run execute store result score $inv_cnt vortex.tmp run clear @s *[minecraft:custom_data=$(custom_data)] 0
execute store result storage vortex:output count int 1 run scoreboard players get $inv_cnt vortex.tmp
