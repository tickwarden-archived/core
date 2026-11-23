# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/math/sign [MACRO]
execute if data storage macroengine:engine modules{math:0b} run return 0
$scoreboard players set $sign_v macroengine.tmp $(value)
execute if score $sign_v macroengine.tmp matches 1.. run data modify storage macroengine:output result set value 1
execute if score $sign_v macroengine.tmp matches 0 run data modify storage macroengine:output result set value 0
execute if score $sign_v macroengine.tmp matches ..-1 run data modify storage macroengine:output result set value -1
