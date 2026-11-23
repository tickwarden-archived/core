# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/_cut_ab
# win = substring [#tx_a, #tx_b) of storage macroengine:text s. An empty range yields "" directly.
execute if score #tx_a macroengine.tmp = #tx_b macroengine.tmp run data modify storage macroengine:text win set value ""
execute if score #tx_a macroengine.tmp = #tx_b macroengine.tmp run return 1
execute store result storage macroengine:text arg.a int 1 run scoreboard players get #tx_a macroengine.tmp
execute store result storage macroengine:text arg.b int 1 run scoreboard players get #tx_b macroengine.tmp
function macroengine:core/internal/text/_cut with storage macroengine:text arg
return 1
