# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/cooldown/remaining [MACRO]
data modify storage macroengine:output result set value 0
$execute unless data storage macroengine:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cd_exp macroengine.tmp run data get storage macroengine:engine cooldowns.$(player).$(key)
execute store result score $cd_now macroengine.tmp run scoreboard players get $epoch macroengine.time

scoreboard players operation $cd_exp macroengine.tmp -= $cd_now macroengine.tmp
execute if score $cd_exp macroengine.tmp matches 1.. run execute store result storage macroengine:output result int 1 run scoreboard players get $cd_exp macroengine.tmp
