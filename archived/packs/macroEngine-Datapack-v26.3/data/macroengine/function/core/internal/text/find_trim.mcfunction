# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/find_trim [INTERNAL] keep only the last |n| matches
scoreboard players set #tx_m1 macroengine.tmp -1
scoreboard players operation #tx_drop macroengine.tmp = #tx_max macroengine.tmp
scoreboard players operation #tx_drop macroengine.tmp *= #tx_m1 macroengine.tmp
scoreboard players operation #tx_drop macroengine.tmp -= #tx_hits macroengine.tmp
scoreboard players operation #tx_drop macroengine.tmp *= #tx_m1 macroengine.tmp
execute if score #tx_drop macroengine.tmp matches 1.. run function macroengine:core/internal/text/find_drop
